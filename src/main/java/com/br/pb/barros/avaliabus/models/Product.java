package com.br.pb.barros.avaliabus.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import java.math.BigDecimal;
import com.br.pb.barros.avaliabus.models.Empresa;

@Entity
public class Product
{

   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   private Integer id;
   private String name;
   private String description;
   private BigDecimal price;
   @ManyToOne
   private Empresa category;

   public Integer getId()
   {
      return this.id;
   }

   public void setId(Integer id)
   {
      this.id = id;
   }

   public String getName()
   {
      return this.name;
   }

   public void setName(String name)
   {
      this.name = name;
   }

   public String getDescription()
   {
      return this.description;
   }

   public void setDescription(String description)
   {
      this.description = description;
   }

   public BigDecimal getPrice()
   {
      return this.price;
   }

   public void setPrice(BigDecimal price)
   {
      this.price = price;
   }

   public Empresa getCategory()
   {
      return this.category;
   }

   public void setCategory(Empresa category)
   {
      this.category = category;
   }
}
