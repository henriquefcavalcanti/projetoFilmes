package br.com.example.backend.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.example.backend.model.Filme;
import br.com.example.backend.repository.FilmeRepository;
import br.com.example.backend.service.exceptions.ObjectNotFoundException;

@Service
public class FilmeService {

	@Autowired
	private FilmeRepository filmeRepository;

	public List<Filme> findAll() {
		return filmeRepository.findAll();
	}

	public Filme findById(Long id) {
		Optional<Filme> filme = filmeRepository.findById(id);
		return filme.orElseThrow(() -> new ObjectNotFoundException(
				"Filme não encontrado! Id: " + id + ", Tipo: " + Filme.class.getName()));
	}

}
