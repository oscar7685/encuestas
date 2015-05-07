/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udec.entidades;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
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
 * @author PLANEACION
 */
@Entity
@Table(name = "encuesta", catalog = "encuestasi", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Encuesta.findAll", query = "SELECT e FROM Encuesta e"),
    @NamedQuery(name = "Encuesta.findByIdencuesta", query = "SELECT e FROM Encuesta e WHERE e.idencuesta = :idencuesta"),
    @NamedQuery(name = "Encuesta.findByNombre", query = "SELECT e FROM Encuesta e WHERE e.nombre = :nombre"),
    @NamedQuery(name = "Encuesta.findByObjetivo", query = "SELECT e FROM Encuesta e WHERE e.objetivo = :objetivo")})
public class Encuesta implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idencuesta")
    private Integer idencuesta;
    @Size(max = 45)
    @Column(name = "nombre")
    private String nombre;
    @Size(max = 2000)
    @Column(name = "objetivo")
    private String objetivo;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "encuestaIdencuesta")
    private List<Pregunta> preguntaList;

    public Encuesta() {
    }

    public Encuesta(Integer idencuesta) {
        this.idencuesta = idencuesta;
    }

    public Integer getIdencuesta() {
        return idencuesta;
    }

    public void setIdencuesta(Integer idencuesta) {
        this.idencuesta = idencuesta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }

    @XmlTransient
    public List<Pregunta> getPreguntaList() {
        return preguntaList;
    }

    public void setPreguntaList(List<Pregunta> preguntaList) {
        this.preguntaList = preguntaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idencuesta != null ? idencuesta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Encuesta)) {
            return false;
        }
        Encuesta other = (Encuesta) object;
        if ((this.idencuesta == null && other.idencuesta != null) || (this.idencuesta != null && !this.idencuesta.equals(other.idencuesta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.udec.entidades.Encuesta[ idencuesta=" + idencuesta + " ]";
    }
    
}
