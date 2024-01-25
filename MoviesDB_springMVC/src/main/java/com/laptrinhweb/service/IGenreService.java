package com.laptrinhweb.service;

import com.laptrinhweb.dto.GenreDTO;
import com.laptrinhweb.entity.GenreEntity;

public interface IGenreService {
	GenreDTO save(GenreDTO genre);
	void delete(Long[] ids);
}
