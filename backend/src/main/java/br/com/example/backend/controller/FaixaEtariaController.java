package br.com.example.backend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.example.backend.model.FaixaEtaria;
import br.com.example.backend.service.FaixaEtariaService;

@RestController
@RequestMapping("/faixaEtaria")
public class FaixaEtariaController {
	
	@Autowired
	private FaixaEtariaService faixaEtariaService;
	
	@GetMapping
	public List<FaixaEtaria> findAll() {
		return faixaEtariaService.findAll();
	}

}
