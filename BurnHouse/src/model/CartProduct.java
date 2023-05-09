package model;

public class CartProduct {
	 private int codice;
	 private String nome;
	 private double prezzo;
	 private int quantita;
	 
	 
	 public void SetCode(int code)
	 {
		 this.codice=code;
	 }
	public int GetCode()
	{
	return this.codice;
	}
	
	public void SetNome(String name)
	{
		this.nome=name;
	}
	
	public String GetNome()
	{
		return this.nome;
	}
	
	public void SetQuantita(int quan)
	{
		this.quantita=quan;
	}
	
	public int GetQuantita()
	{
		return this.quantita;
	}
	
	public void IncrQuantita()
	{
		this.quantita=quantita+1;
	}
	
	public void DecrQuantita()
	{
		this.quantita=quantita-1;
	}
	
	
	public void SetPrezzo(double price)
	{
		this.prezzo=price;
	}
	
	public double GetPrezzo()
	{
		return this.prezzo;
	}
	}