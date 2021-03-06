package com.xgs.hisystem.service.impl;

import com.xgs.hisystem.config.HisConstants;
import com.xgs.hisystem.pojo.bo.BaseResponse;
import com.xgs.hisystem.pojo.bo.PageRspBO;
import com.xgs.hisystem.pojo.entity.*;
import com.xgs.hisystem.pojo.vo.register.*;
import com.xgs.hisystem.repository.*;
import com.xgs.hisystem.service.IGetPatientInfoService;
import com.xgs.hisystem.service.IRegisterService;
import com.xgs.hisystem.util.DateUtil;
import com.xgs.hisystem.util.IdCardValidUtil;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import static com.xgs.hisystem.util.card.Card.defaultGetCardId;
import static java.time.LocalDate.now;

/**
 * @author xgs
 * @date 2019/4/19
 * @description:
 */
@Service
public class RegisterServiceImpl implements IRegisterService {

    @Autowired
    private IUserRepository iUserRepository;

    @Autowired
    private IIDcardRepository iiDcardRepository;

    @Autowired
    private IPatientRepository iPatientRepository;
    @Autowired
    private IRegisterRepository iRegisterRepository;
    @Autowired
    private IOutpatientQueueRepository iOutpatientQueueRepository;
    @Autowired
    private IGetPatientInfoService iGetPatientInfoService;
    @Autowired
    private IDepartmentRepository iDepartmentRepository;

    private static final Logger logger = LoggerFactory.getLogger(RegisterServiceImpl.class);

    /**
     * ?????????????????????
     *
     * @return
     */
    @Override
    public PatientInforRspVO getCardIdInfor(GetCardIdInforReqVO reqVO) throws Exception {

        PatientInforRspVO rspVO = new PatientInforRspVO();

        try {
            //??????????????????
            BaseResponse<PatientEntity> baseResponse = iGetPatientInfoService.getPatientInfo(reqVO);

            if (BaseResponse.RESPONSE_FAIL.equals(baseResponse.getStatus())) {
                rspVO.setMessage(baseResponse.getMessage());
                return rspVO;
            }
            PatientEntity patientInfor = baseResponse.getData();

            String patientId = patientInfor.getId();

            List<RegisterEntity> registerList = iRegisterRepository.findByPatientId(patientId);

            if (registerList != null && !registerList.isEmpty()) {
                //???????????????
                List<RegisterEntity> expiredList = new ArrayList<>();

                for (RegisterEntity register : registerList) {

                    int registerStatus = register.getRegisterStatus();
                    int treatmentStatus = register.getTreatmentStatus();
                    int chargeStatus = register.getChargeStatus();
                    //?????????
                    if (registerStatus == 1) {
                        //??????????????????
                        if (treatmentStatus == 0) {

                            String createDate = DateUtil.DateTimeToDate(register.getCreateDatetime());
                            String nowDate = DateUtil.getCurrentDateSimpleToString();
                            //???????????????
                            if (nowDate.equals(createDate)) {

                                //???????????????????????????????????????
                                OutpatientQueueEntity outpatientQueue = iOutpatientQueueRepository.findByRegisterId(register.getId());
                                if (outpatientQueue != null && outpatientQueue.getOutpatientQueueStatus() == HisConstants.QUEUE.NORMAL) {
                                    String doctorName = Arrays.asList(outpatientQueue.getDescription().split("#")).get(1);
                                    rspVO.setMessage("???????????????????????????????????????????????????????????????" + doctorName);
                                    return rspVO;
                                }
                            }
                            //???????????????????????????????????????-1 ????????????
                            else {
                                register.setRegisterStatus(-1);
                                expiredList.add(register);
                            }
                        }
                        //??????????????????
                        if (treatmentStatus == 1 && chargeStatus == 0) {
                            rspVO.setMessage("??????????????????????????????????????????????????????");
                            return rspVO;
                        }
                    }
                }
                iRegisterRepository.saveAll(expiredList);
            }
            rspVO.setAge(DateUtil.getAge(patientInfor.getBirthday()));
            BeanUtils.copyProperties(patientInfor, rspVO);
        } catch (Exception e) {
            rspVO.setMessage("????????????????????????????????????????????????????????????????????????????????????");
            e.printStackTrace();
        }
        return rspVO;
    }


    /**
     * ???????????????????????????????????????IC???????????????????????????
     * ?????????????????????
     *
     * @return
     */
    @Override
    public IDcardRspVO getIDcardInfor() {

        String message = defaultGetCardId();

        IDcardRspVO iDcardRspVO = new IDcardRspVO();

        if ("fail".equals(message)) {
            iDcardRspVO.setMessage("????????????????????????????????????");
            return iDcardRspVO;
        } else if ("none".equals(message)) {
            iDcardRspVO.setMessage("?????????????????????");
            return iDcardRspVO;
        } else {
            IDcardEntity iDcardEntity = iiDcardRepository.findByCardId(message);

            if (iDcardEntity == null) {
                iDcardRspVO.setMessage("???????????????????????????????????????");
                return iDcardRspVO;
            }
            BeanUtils.copyProperties(iDcardEntity, iDcardRspVO);
            return iDcardRspVO;
        }
    }

    /**
     * ????????????
     *
     * @return
     */
    @Override
    public BaseResponse<String> getDefaultGetCardId() {

        return BaseResponse.success(defaultGetCardId());
    }

    /**
     * ???????????????
     *
     * @param reqVO
     * @return
     */
    @Override
    public BaseResponse<String> addPatientInfor(PatientInforReqVO reqVO) throws Exception {

        boolean bool = IdCardValidUtil.validateIdCard(reqVO.getIdCard());
        if (!bool) {
            return BaseResponse.error("??????????????????????????????");
        }

        try {
            //????????????????????????????????????
            PatientEntity patientEntity1 = iPatientRepository.findByCardId(reqVO.getCardId());
            if (!StringUtils.isEmpty(patientEntity1)) {
                return BaseResponse.error(HisConstants.REGISTER.ACTIVATED);
            }
            //?????????????????????????????????
            PatientEntity patientEntity2 = iPatientRepository.findByIdCard(reqVO.getIdCard());
            if (!StringUtils.isEmpty(patientEntity2)) {
                return BaseResponse.error(HisConstants.REGISTER.COVER);
            }

            PatientEntity patientInfor = new PatientEntity();
            BeanUtils.copyProperties(reqVO, patientInfor);

            iPatientRepository.saveAndFlush(patientInfor);
            return BaseResponse.success(HisConstants.USER.SUCCESS);
        } catch (Exception e) {
            return BaseResponse.error("??????????????????????????????????????????");
        }
    }

    /**
     * ???????????????
     *
     * @param reqVO
     * @return
     */
    @Override
    public BaseResponse<String> coverCardId(PatientInforReqVO reqVO) {

        PatientEntity patientInfor = iPatientRepository.findByIdCard(reqVO.getIdCard());
        if (StringUtils.isEmpty(patientInfor)) {
            return BaseResponse.error(HisConstants.USER.FAIL);
        }
        patientInfor.setCardId(reqVO.getCardId());

        try {
            iPatientRepository.saveAndFlush(patientInfor);
            return BaseResponse.success(HisConstants.USER.SUCCESS);
        } catch (Exception e) {
            return BaseResponse.error("????????????????????????");
        }
    }

    /**
     * ??????????????????
     *
     * @param reqVO
     * @return
     */
    @Override
    public List<RegisterDoctorRspVO> getAllRegisterDoctor(RegisterTypeReqVO reqVO) {

        List<RegisterDoctorRspVO> registerDoctorRspList = new ArrayList<>();

        List<UserEntity> userList = iUserRepository.findByDepartmentAndDepartmentType(reqVO.getDepartment(), reqVO.getRegisterType());

        if (userList != null && userList.size() > 0) {
            RegisterDoctorRspVO registerDoctorRspVO = new RegisterDoctorRspVO();
            userList.forEach(user -> {
                //??????????????????
                if (!DateUtil.getCurrentDateSimpleToString().equals(user.getUpdateTime())) {
                    user.setNowNum(0);
                    user.setUpdateTime(DateUtil.getCurrentDateSimpleToString());
                    iUserRepository.saveAndFlush(user);
                }
                registerDoctorRspVO.setDoctorName(user.getUsername());
                registerDoctorRspVO.setAllowNum(user.getAllowNum());
                registerDoctorRspVO.setNowNum(user.getNowNum());
                registerDoctorRspVO.setWorkDateTime(user.getWorkDateTime());
                registerDoctorRspVO.setPrice(user.getTreatmentPrice());
                registerDoctorRspVO.setId(user.getId());
                registerDoctorRspVO.setWorkAddress(user.getWorkAddress());

                registerDoctorRspList.add(registerDoctorRspVO);
            });

        }

        return registerDoctorRspList;
    }

    /**
     * ??????????????????
     *
     * @param reqVO
     * @return
     */
    @Override
    public BaseResponse<String> addRegisterInfor(RegisterInforReqVO reqVO) {

        try {

            UserEntity user = (UserEntity) SecurityUtils.getSubject().getPrincipal();
            if (StringUtils.isEmpty(user)) {
                return BaseResponse.error("????????????????????????");
            }
            Optional<UserEntity> userDoctor = iUserRepository.findById(reqVO.getDoctorId());

            if (!userDoctor.isPresent()) {
                return BaseResponse.error("???????????????????????????????????????????????????");
            }
            int allowNum = userDoctor.get().getAllowNum();
            int nowNum = userDoctor.get().getNowNum();
            if (nowNum == allowNum) {
                return BaseResponse.error("?????????????????????????????????????????????????????????????????????");
            }


            PatientEntity patient = iPatientRepository.findByCardId(reqVO.getCardId());

            //????????????????????????????????????????????????????????????????????????????????????
            List<RegisterEntity> registerTemp = iRegisterRepository.findAll(new Specification<RegisterEntity>() {
                @Override
                public Predicate toPredicate(Root<RegisterEntity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                    List<Predicate> filter = new ArrayList<>();

                    filter.add(cb.equal(root.get("patient"), patient));
                    filter.add(cb.equal(root.get("registerStatus"), 1));
                    filter.add(cb.equal(root.get("treatmentStatus"), 0));
                    //??????
                    String nowDate = DateUtil.getCurrentDateSimpleToString();
                    filter.add(cb.between(root.get("createDatetime"), nowDate.concat(" 00:00:00"), nowDate.concat(" 23:59:59")));

                    return query.where(filter.toArray(new Predicate[filter.size()])).getRestriction();
                }
            });
            if (registerTemp != null && !registerTemp.isEmpty()) {

                if (registerTemp.size() != 1) {
                    return BaseResponse.error("??????????????????????????????????????????");
                }
                if (!"12".equals(reqVO.getDepartment())) {
                    return BaseResponse.error("???????????????????????????????????????????????????");
                }
            }


            //?????????????????????
            userDoctor.get().setNowNum(nowNum + 1);
            iUserRepository.saveAndFlush(userDoctor.get());

            //??????????????????
            RegisterEntity register = new RegisterEntity();
            register.setDepartment(reqVO.getDepartment());
            register.setDoctor(reqVO.getDoctor());
            register.setDoctorId(reqVO.getDoctorId());
            register.setOperatorName(user.getUsername());
            register.setOperatorEmail(user.getEmail());
            register.setPatient(patient);
            register.setPayType(reqVO.getPayType());
            register.setRegisterType(reqVO.getRegisterType());
            register.setTreatmentPrice(reqVO.getTreatmentPrice());
            register.setRegisterStatus(1);

            String registeredNum = "RE" + System.currentTimeMillis() + (int) (Math.random() * 900 + 100);
            register.setRegisteredNum(registeredNum);

            iRegisterRepository.saveAndFlush(register);

            //???????????????????????????
            OutpatientQueueEntity outpatientQueue = new OutpatientQueueEntity();

            outpatientQueue.setPatient(patient);
            outpatientQueue.setRegister(register);
            outpatientQueue.setUser(userDoctor.get());
            outpatientQueue.setDescription(patient.getName() + '#' + userDoctor.get().getUsername());
            outpatientQueue.setOutpatientQueueStatus(HisConstants.QUEUE.NORMAL);

            iOutpatientQueueRepository.saveAndFlush(outpatientQueue);

            return BaseResponse.success(HisConstants.USER.SUCCESS);
        } catch (Exception e) {
            logger.error("???????????????????????????", e);
            return BaseResponse.error("???????????????????????????????????????");
        }
    }

    /**
     * ??????????????????
     *
     * @param reqVO
     * @return
     */
    @Override
    public PageRspBO<RegisterRecordRspVO> getRegisterRecord(RegisterRecordSearchReqVO reqVO) {
        Page<RegisterEntity> page = iRegisterRepository.findAll(new Specification<RegisterEntity>() {
            @Override
            public Predicate toPredicate(Root<RegisterEntity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicateList = new ArrayList<>();

                if (!StringUtils.isEmpty(reqVO.getDepartment())) {
                    predicateList.add(cb.equal(root.get("department"), reqVO.getDepartment()));
                }
                if (!StringUtils.isEmpty(reqVO.getRegisterType())) {
                    predicateList.add(cb.equal(root.get("registerType"), reqVO.getRegisterType()));
                }
                if (!StringUtils.isEmpty(reqVO.getStartTime())) {
                    predicateList.add(cb.greaterThanOrEqualTo(root.get("createDatetime"), reqVO.getStartTime()));
                }
                if (!StringUtils.isEmpty(reqVO.getEndTime())) {
                    predicateList.add(cb.lessThanOrEqualTo(root.get("createDatetime"), reqVO.getEndTime()));
                }

                //????????????
                if (StringUtils.isEmpty(reqVO.getDepartment()) && StringUtils.isEmpty(reqVO.getRegisterType())
                        && StringUtils.isEmpty(reqVO.getStartTime()) && StringUtils.isEmpty(reqVO.getEndTime())) {
                    predicateList.add(cb.greaterThanOrEqualTo(root.get("createDatetime"), now().toString()));
                }

                query.where(predicateList.toArray(new Predicate[predicateList.size()]));
                return null;
            }
        }, PageRequest.of(reqVO.getPageNumber(), reqVO.getPageSize(), Sort.Direction.DESC, "createDatetime"));
        if (page == null) {
            return null;
        }
        List<RegisterEntity> registerList = page.getContent();
        List<RegisterRecordRspVO> registerRecordList = new ArrayList<>();
        registerList.forEach(register -> {
            RegisterRecordRspVO registerRecord = new RegisterRecordRspVO();
            registerRecord.setCardId(register.getPatient().getCardId());

            String departmentName = "";
            DepartmentEntity department = iDepartmentRepository.findByCode(Integer.parseInt(register.getDepartment()));
            if (department != null) {
                departmentName = department.getName();
            }
            registerRecord.setDepartment(departmentName);

            registerRecord.setRegisterType(register.getRegisterType());
            registerRecord.setName(register.getPatient().getName());
            registerRecord.setDoctor(register.getDoctor());
            registerRecord.setCreateDateTime(register.getCreateDatetime());
            registerRecord.setCreatePerson(register.getOperatorName());
            registerRecord.setCreatePersonEmail(register.getOperatorEmail());
            registerRecordList.add(registerRecord);
        });
        PageRspBO pageRspBO = new PageRspBO();
        pageRspBO.setTotal(page.getTotalElements());
        pageRspBO.setRows(registerRecordList);
        return pageRspBO;
    }

}
