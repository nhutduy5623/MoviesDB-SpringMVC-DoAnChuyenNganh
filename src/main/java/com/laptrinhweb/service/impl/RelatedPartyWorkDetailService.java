package com.laptrinhweb.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhweb.dto.RelatedPartyDTO;
import com.laptrinhweb.dto.RelatedPartyWorkDetailDTO;
import com.laptrinhweb.dto.WorkDTO;
import com.laptrinhweb.entity.RelatedPartyWorkDetailEntity;
import com.laptrinhweb.repository.IRelatedPartyWorkDetailRepository;
import com.laptrinhweb.service.IRelatedPartyDetailService;
import com.laptrinhweb.service.impl.convertEntity_DTO.RelatedPartyConvert;

@Service
public class RelatedPartyWorkDetailService implements IRelatedPartyDetailService {

	@Autowired
	IRelatedPartyWorkDetailRepository relatedPartyWorkDetailRepository;
	
	@Autowired
	RelatedPartyConvert relatedPartyConvert;

	@Override
	public RelatedPartyWorkDetailDTO save(RelatedPartyWorkDetailDTO relatedPartyDetailDTO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Long[] ids) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<RelatedPartyWorkDetailDTO> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<RelatedPartyDTO, String> findRPDetailByWork(WorkDTO workDTO) {
		List<RelatedPartyWorkDetailEntity> listRPWDetail = relatedPartyWorkDetailRepository.findRelatedPartyDetailsByWorkId(workDTO.getId());
		Map<RelatedPartyDTO, String> mapRPWork = new HashMap<RelatedPartyDTO, String>();
		for(RelatedPartyWorkDetailEntity rpwDetail: listRPWDetail) {
			mapRPWork.put(relatedPartyConvert.toDTO(rpwDetail.getRelatedParty()), rpwDetail.getRole());
		}
		return mapRPWork;
	}
	
	
}
