package br.com.example.backend.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "filme")
public class Filme implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String urlImage;
	private String titulo;
	private String genero;

	@ManyToOne
	@JoinColumn(name = "faixa_etaria_id", nullable = false)
	private FaixaEtaria faixaEtaria;
	private int duracao;
	private double nota;
	private int ano;
	private String descricao;

	public Filme() {
		super();
	}

	public Filme(Long id, String urlImage, String titulo, String genero, Long faixaEtariaId, int duracao, double nota,
			int ano, String descricao) {
		super();
		this.id = id;
		this.urlImage = urlImage;
		this.titulo = titulo;
		this.genero = genero;
		this.faixaEtaria = new FaixaEtaria(faixaEtariaId);
		this.duracao = duracao;
		this.nota = nota;
		this.ano = ano;
		this.descricao = descricao;
	}

	public Filme(Long id, String urlImage, String titulo, String genero, FaixaEtaria faixaEtaria, int duracao,
			double nota, int ano, String descricao) {
		super();
		this.id = id;
		this.urlImage = urlImage;
		this.titulo = titulo;
		this.genero = genero;
		this.faixaEtaria = faixaEtaria;
		this.duracao = duracao;
		this.nota = nota;
		this.ano = ano;
		this.descricao = descricao;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUrlImage() {
		return urlImage;
	}

	public void setUrlImage(String urlImage) {
		this.urlImage = urlImage;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getGenero() {
		return genero;
	}

	public void setGenero(String genero) {
		this.genero = genero;
	}

	public FaixaEtaria getFaixaEtaria() {
		return faixaEtaria;
	}

	public void setFaixaEtaria(FaixaEtaria faixaEtaria) {
		this.faixaEtaria = faixaEtaria;
	}

	public int getDuracao() {
		return duracao;
	}

	public void setDuracao(int duracao) {
		this.duracao = duracao;
	}

	public double getNota() {
		return nota;
	}

	public void setNota(double nota) {
		this.nota = nota;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

}
