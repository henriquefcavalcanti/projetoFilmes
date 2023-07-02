package br.com.example.backend.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.example.backend.model.FaixaEtaria;
import br.com.example.backend.repository.FaixaEtariaRepository;

@Service
public class FaixaEtariaService {
	@Autowired
	private FaixaEtariaRepository faixaEtariaRepository;

	public List<FaixaEtaria> findAll() {
		return faixaEtariaRepository.findAll();
	}

}
