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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "respuesta", catalog = "encuestas", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Respuesta.findAll", query = "SELECT r FROM Respuesta r"),
    @NamedQuery(name = "Respuesta.findByIdrespuesta", query = "SELECT r FROM Respuesta r WHERE r.idrespuesta = :idrespuesta"),
    @NamedQuery(name = "Respuesta.findByRespuesta", query = "SELECT r FROM Respuesta r WHERE r.respuesta = :respuesta"),
    @NamedQuery(name = "Respuesta.findByOrden", query = "SELECT r FROM Respuesta r WHERE r.orden = :orden")})
public class Respuesta implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idrespuesta")
    private Integer idrespuesta;
    @Size(max = 100)
    @Column(name = "respuesta")
    private String respuesta;
    @Column(name = "orden")
    private Integer orden;
    @OneToMany(mappedBy = "respuestaIdrespuesta")
    private List<Resultados> resultadosList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "respuestaCondicionadora")
    private List<Condicion> condicionList;
    @JoinColumn(name = "pregunta_idpregunta", referencedColumnName = "idpregunta")
    @ManyToOne(optional = false)
    private Pregunta preguntaIdpregunta;
    @JoinColumn(name = "grupo_respuestas_idgrupo_respuestas", referencedColumnName = "idgrupo_respuestas")
    @ManyToOne
    private GrupoRespuestas grupoRespuestasIdgrupoRespuestas;

    public Respuesta() {
    }

    public Respuesta(Integer idrespuesta) {
        this.idrespuesta = idrespuesta;
    }

    public Integer getIdrespuesta() {
        return idrespuesta;
    }

    public void setIdrespuesta(Integer idrespuesta) {
        this.idrespuesta = idrespuesta;
    }

    public String getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
    }

    public Integer getOrden() {
        return orden;
    }

    public void setOrden(Integer orden) {
        this.orden = orden;
    }

    @XmlTransient
    public List<Resultados> getResultadosList() {
        return resultadosList;
    }

    public void setResultadosList(List<Resultados> resultadosList) {
        this.resultadosList = resultadosList;
    }

    @XmlTransient
    public List<Condicion> getCondicionList() {
        return condicionList;
    }

    public void setCondicionList(List<Condicion> condicionList) {
        this.condicionList = condicionList;
    }

    public Pregunta getPreguntaIdpregunta() {
        return preguntaIdpregunta;
    }

    public void setPreguntaIdpregunta(Pregunta preguntaIdpregunta) {
        this.preguntaIdpregunta = preguntaIdpregunta;
    }

    public GrupoRespuestas getGrupoRespuestasIdgrupoRespuestas() {
        return grupoRespuestasIdgrupoRespuestas;
    }

    public void setGrupoRespuestasIdgrupoRespuestas(GrupoRespuestas grupoRespuestasIdgrupoRespuestas) {
        this.grupoRespuestasIdgrupoRespuestas = grupoRespuestasIdgrupoRespuestas;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idrespuesta != null ? idrespuesta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Respuesta)) {
            return false;
        }
        Respuesta other = (Respuesta) object;
        if ((this.idrespuesta == null && other.idrespuesta != null) || (this.idrespuesta != null && !this.idrespuesta.equals(other.idrespuesta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.udec.entidades.Respuesta[ idrespuesta=" + idrespuesta + " ]";
    }
    
}
