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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Ususario
 */
@Entity
@Table(name = "programa", catalog = "encuestas", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Programa.findAll", query = "SELECT p FROM Programa p"),
    @NamedQuery(name = "Programa.findByIdprograma", query = "SELECT p FROM Programa p WHERE p.idprograma = :idprograma"),
    @NamedQuery(name = "Programa.findByPrograma", query = "SELECT p FROM Programa p WHERE p.programa = :programa")})
public class Programa implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "idprograma")
    private Integer idprograma;
    @Size(max = 100)
    @Column(name = "programa")
    private String programa;
    @JoinColumn(name = "facultad_idfacultad", referencedColumnName = "idfacultad")
    @ManyToOne(optional = false)
    private Facultad facultadIdfacultad;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "programaIdprograma")
    private List<Persona> personaList;

    public Programa() {
    }

    public Programa(Integer idprograma) {
        this.idprograma = idprograma;
    }

    public Integer getIdprograma() {
        return idprograma;
    }

    public void setIdprograma(Integer idprograma) {
        this.idprograma = idprograma;
    }

    public String getPrograma() {
        return programa;
    }

    public void setPrograma(String programa) {
        this.programa = programa;
    }

    public Facultad getFacultadIdfacultad() {
        return facultadIdfacultad;
    }

    public void setFacultadIdfacultad(Facultad facultadIdfacultad) {
        this.facultadIdfacultad = facultadIdfacultad;
    }

    @XmlTransient
    public List<Persona> getPersonaList() {
        return personaList;
    }

    public void setPersonaList(List<Persona> personaList) {
        this.personaList = personaList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idprograma != null ? idprograma.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Programa)) {
            return false;
        }
        Programa other = (Programa) object;
        if ((this.idprograma == null && other.idprograma != null) || (this.idprograma != null && !this.idprograma.equals(other.idprograma))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.udec.entidades.Programa[ idprograma=" + idprograma + " ]";
    }
    
}
