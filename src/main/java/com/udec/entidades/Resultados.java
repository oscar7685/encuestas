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
 * @author Ususario
 */
@Entity
@Table(name = "resultados", catalog = "encuestas", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Resultados.findAll", query = "SELECT r FROM Resultados r"),
    @NamedQuery(name = "Resultados.findByIdresultados", query = "SELECT r FROM Resultados r WHERE r.idresultados = :idresultados"),
    @NamedQuery(name = "Resultados.findByValor", query = "SELECT r FROM Resultados r WHERE r.valor = :valor"),
    @NamedQuery(name = "Resultados.findByOrden", query = "SELECT r FROM Resultados r WHERE r.orden = :orden")})
public class Resultados implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idresultados")
    private Integer idresultados;
    @Size(max = 2000)
    @Column(name = "valor")
    private String valor;
    @Column(name = "orden")
    private Integer orden;
    @JoinColumn(name = "respuesta_idrespuesta", referencedColumnName = "idrespuesta")
    @ManyToOne
    private Respuesta respuestaIdrespuesta;
    @JoinColumn(name = "pregunta_idpregunta", referencedColumnName = "idpregunta")
    @ManyToOne(optional = false)
    private Pregunta preguntaIdpregunta;
    @JoinColumn(name = "persona_idpersona", referencedColumnName = "idpersona")
    @ManyToOne(optional = false)
    private Persona personaIdpersona;

    public Resultados() {
    }

    public Resultados(Integer idresultados) {
        this.idresultados = idresultados;
    }

    public Integer getIdresultados() {
        return idresultados;
    }

    public void setIdresultados(Integer idresultados) {
        this.idresultados = idresultados;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    public Integer getOrden() {
        return orden;
    }

    public void setOrden(Integer orden) {
        this.orden = orden;
    }

    public Respuesta getRespuestaIdrespuesta() {
        return respuestaIdrespuesta;
    }

    public void setRespuestaIdrespuesta(Respuesta respuestaIdrespuesta) {
        this.respuestaIdrespuesta = respuestaIdrespuesta;
    }

    public Pregunta getPreguntaIdpregunta() {
        return preguntaIdpregunta;
    }

    public void setPreguntaIdpregunta(Pregunta preguntaIdpregunta) {
        this.preguntaIdpregunta = preguntaIdpregunta;
    }

    public Persona getPersonaIdpersona() {
        return personaIdpersona;
    }

    public void setPersonaIdpersona(Persona personaIdpersona) {
        this.personaIdpersona = personaIdpersona;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idresultados != null ? idresultados.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Resultados)) {
            return false;
        }
        Resultados other = (Resultados) object;
        if ((this.idresultados == null && other.idresultados != null) || (this.idresultados != null && !this.idresultados.equals(other.idresultados))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.udec.entidades.Resultados[ idresultados=" + idresultados + " ]";
    }
    
}
