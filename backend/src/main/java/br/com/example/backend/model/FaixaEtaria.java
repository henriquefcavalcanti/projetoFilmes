package br.com.example.backend.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "faixa_etaria")
public class FaixaEtaria implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	String descricao;

	@JsonIgnore
	@OneToMany(mappedBy = "faixaEtaria")
	private Set<Filme> filmes;

	public FaixaEtaria() {
		super();
	}

	public FaixaEtaria(Long id, String descricao, Set<Filme> filmes) {
		super();
		this.id = id;
		this.descricao = descricao;
		this.filmes = filmes;
	}
	
	public FaixaEtaria(Long id) {
		super();
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Set<Filme> getFilmes() {
		return filmes;
	}

	public void setFilmes(Set<Filme> filmes) {
		this.filmes = filmes;
	}

}
