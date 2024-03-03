package com.laptrinhweb.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhweb.dto.RelatedPartyDTO;
import com.laptrinhweb.service.IRelatedPartyService;

@RestController(value = "RelatedPartyAPI_ADMIN")
public class RelatedPartyAPI {
	@Autowired
	IRelatedPartyService relatedPartyService;

	@PostMapping("/api/admin/relatedparty")
	public RelatedPartyDTO createRelatedParty(@RequestBody RelatedPartyDTO relatedParty) {
		return relatedPartyService.save(relatedParty);
	}

	@PutMapping("/api/admin/relatedparty")
	public RelatedPartyDTO updateRelatedParty(@RequestBody RelatedPartyDTO relatedParty) {
		return relatedPartyService.save(relatedParty);
	}

	@DeleteMapping("/api/admin/relatedparty")
	public void deleteRelatedParty(@RequestBody Long[] ids) {
		relatedPartyService.delete(ids);
	}

}
