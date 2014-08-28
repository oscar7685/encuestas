/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.udec.entidades;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Ususario
 */
@Entity
@Table(name = "grupo_respuestas", catalog = "encuestas", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "GrupoRespuestas.findAll", query = "SELECT g FROM GrupoRespuestas g"),
    @NamedQuery(name = "GrupoRespuestas.findByIdgrupoRespuestas", query = "SELECT g FROM GrupoRespuestas g WHERE g.idgrupoRespuestas = :idgrupoRespuestas"),
    @NamedQuery(name = "GrupoRespuestas.findByNombre", query = "SELECT g FROM GrupoRespuestas g WHERE g.nombre = :nombre")})
public class GrupoRespuestas implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idgrupo_respuestas")
    private Integer idgrupoRespuestas;
    @Size(max = 255)
    @Column(name = "nombre")
    private String nombre;
    @OneToMany(mappedBy = "grupoRespuestasIdgrupoRespuestas")
    private List<Respuesta> respuestaList;

    public GrupoRespuestas() {
    }

    public GrupoRespuestas(Integer idgrupoRespuestas) {
        this.idgrupoRespuestas = idgrupoRespuestas;
    }

    public Integer getIdgrupoRespuestas() {
        return idgrupoRespuestas;
    }

    public void setIdgrupoRespuestas(Integer idgrupoRespuestas) {
        this.idgrupoRespuestas = idgrupoRespuestas;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @XmlTransient
    public List<Respuesta> getRespuestaList() {
        return respuestaList;
    }

    public void setRespuestaList(List<Respuesta> respuestaList) {
        this.respuestaList = respuestaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idgrupoRespuestas != null ? idgrupoRespuestas.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof GrupoRespuestas)) {
            return false;
        }
        GrupoRespuestas other = (GrupoRespuestas) object;
        if ((this.idgrupoRespuestas == null && other.idgrupoRespuestas != null) || (this.idgrupoRespuestas != null && !this.idgrupoRespuestas.equals(other.idgrupoRespuestas))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.udec.entidades.GrupoRespuestas[ idgrupoRespuestas=" + idgrupoRespuestas + " ]";
    }
    
}
