/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udec.entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author PLANEACION
 */
@Entity
@Table(name = "condicion", catalog = "encuestasi", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Condicion.findAll", query = "SELECT c FROM Condicion c"),
    @NamedQuery(name = "Condicion.findByIdcondicion", query = "SELECT c FROM Condicion c WHERE c.idcondicion = :idcondicion"),
    @NamedQuery(name = "Condicion.findByTipo", query = "SELECT c FROM Condicion c WHERE c.tipo = :tipo")})
public class Condicion implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idcondicion")
    private Integer idcondicion;
    @Size(max = 45)
    @Column(name = "tipo")
    private String tipo;
    @JoinColumn(name = "preguntaCondicionada", referencedColumnName = "idpregunta")
    @ManyToOne(optional = false)
    private Pregunta preguntaCondicionada;
    @JoinColumn(name = "preguntaCondicionadora", referencedColumnName = "idpregunta")
    @ManyToOne(optional = false)
    private Pregunta preguntaCondicionadora;
    @JoinColumn(name = "respuestaCondicionadora", referencedColumnName = "idrespuesta")
    @ManyToOne(optional = false)
    private Respuesta respuestaCondicionadora;

    public Condicion() {
    }

    public Condicion(Integer idcondicion) {
        this.idcondicion = idcondicion;
    }

    public Integer getIdcondicion() {
        return idcondicion;
    }

    public void setIdcondicion(Integer idcondicion) {
        this.idcondicion = idcondicion;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Pregunta getPreguntaCondicionada() {
        return preguntaCondicionada;
    }

    public void setPreguntaCondicionada(Pregunta preguntaCondicionada) {
        this.preguntaCondicionada = preguntaCondicionada;
    }

    public Pregunta getPreguntaCondicionadora() {
        return preguntaCondicionadora;
    }

    public void setPreguntaCondicionadora(Pregunta preguntaCondicionadora) {
        this.preguntaCondicionadora = preguntaCondicionadora;
    }

    public Respuesta getRespuestaCondicionadora() {
        return respuestaCondicionadora;
    }

    public void setRespuestaCondicionadora(Respuesta respuestaCondicionadora) {
        this.respuestaCondicionadora = respuestaCondicionadora;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idcondicion != null ? idcondicion.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Condicion)) {
            return false;
        }
        Condicion other = (Condicion) object;
        if ((this.idcondicion == null && other.idcondicion != null) || (this.idcondicion != null && !this.idcondicion.equals(other.idcondicion))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.udec.entidades.Condicion[ idcondicion=" + idcondicion + " ]";
    }
    
}
