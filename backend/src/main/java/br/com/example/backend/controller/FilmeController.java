package br.com.example.backend.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.example.backend.model.Filme;
import br.com.example.backend.repository.FilmeRepository;
import br.com.example.backend.service.FilmeService;

@RestController
@RequestMapping("/filmes")
public class FilmeController {

	@Autowired
	private FilmeRepository filmeRepository;

	@Autowired
	private FilmeService filmeService;

	@GetMapping
	public List<Filme> findAll() {
		return filmeService.findAll();
	}

	@GetMapping("/{id}")
	public ResponseEntity<Filme> findById(@PathVariable Long id) {
		Optional<Filme> optionalFilme = filmeRepository.findById(id);
		if (optionalFilme.isPresent()) {
			return ResponseEntity.ok().body(optionalFilme.get());
		} else {
			return ResponseEntity.notFound().build();
		}
	}

	@PostMapping
	public Filme save(@RequestBody Filme filme) {
		return filmeRepository.save(filme);
	}

	@PutMapping("/{id}")
	public Filme update(@RequestBody Filme novoFilme, @PathVariable Long id) {
		return filmeRepository.save(novoFilme);
	}

//	@PutMapping("/{id}")
//	public Contato update(@RequestBody Contato novoContato, @PathVariable Long id) {
//
//		return repository.findById(id).map(contato -> {
//			contato.setNome(novoContato.getNome());
//			contato.setEmail(novoContato.getEmail());
//			return repository.save(contato);
//		}).orElseGet(() -> {
//			novoContato.setId(id);
//			return repository.save(novoContato);
//		});
//	}
//
//	@DeleteMapping("/{id}")
//	void delete(@PathVariable Long id) {
//		repository.deleteById(id);
//	}

}
