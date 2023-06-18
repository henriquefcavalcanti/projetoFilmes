package br.com.example.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.example.backend.model.Filme;

@Repository
public interface FilmeRepository extends JpaRepository<Filme, Long>{

}
