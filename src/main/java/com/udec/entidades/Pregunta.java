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
@Table(name = "pregunta", catalog = "encuestas", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Pregunta.findAll", query = "SELECT p FROM Pregunta p"),
    @NamedQuery(name = "Pregunta.findByIdpregunta", query = "SELECT p FROM Pregunta p WHERE p.idpregunta = :idpregunta"),
    @NamedQuery(name = "Pregunta.findByPregunta", query = "SELECT p FROM Pregunta p WHERE p.pregunta = :pregunta"),
    @NamedQuery(name = "Pregunta.findByTipo", query = "SELECT p FROM Pregunta p WHERE p.tipo = :tipo"),
    @NamedQuery(name = "Pregunta.findByOtro", query = "SELECT p FROM Pregunta p WHERE p.otro = :otro"),
    @NamedQuery(name = "Pregunta.findByLabelOtro", query = "SELECT p FROM Pregunta p WHERE p.labelOtro = :labelOtro"),
    @NamedQuery(name = "Pregunta.findByOrden", query = "SELECT p FROM Pregunta p WHERE p.orden = :orden")})
public class Pregunta implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "idpregunta")
    private Integer idpregunta;
    @Size(max = 1000)
    @Column(name = "pregunta")
    private String pregunta;
    @Size(max = 45)
    @Column(name = "tipo")
    private String tipo;
    @Size(max = 45)
    @Column(name = "otro")
    private String otro;
    @Size(max = 45)
    @Column(name = "label_otro")
    private String labelOtro;
    @Column(name = "orden")
    private Integer orden;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "preguntaIdpregunta")
    private List<Resultados> resultadosList;
    @OneToMany(mappedBy = "preguntaPadre")
    private List<Pregunta> preguntaList;
    @JoinColumn(name = "pregunta_padre", referencedColumnName = "idpregunta")
    @ManyToOne
    private Pregunta preguntaPadre;
    @JoinColumn(name = "encuesta_idencuesta", referencedColumnName = "idencuesta")
    @ManyToOne(optional = false)
    private Encuesta encuestaIdencuesta;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "preguntaCondicionadora")
    private List<Condicion> condicionList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "preguntaCondicionada")
    private List<Condicion> condicionList1;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "preguntaIdpregunta")
    private List<Respuesta> respuestaList;

    public Pregunta() {
    }

    public Pregunta(Integer idpregunta) {
        this.idpregunta = idpregunta;
    }

    public Integer getIdpregunta() {
        return idpregunta;
    }

    public void setIdpregunta(Integer idpregunta) {
        this.idpregunta = idpregunta;
    }

    public String getPregunta() {
        return pregunta;
    }

    public void setPregunta(String pregunta) {
        this.pregunta = pregunta;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getOtro() {
        return otro;
    }

    public void setOtro(String otro) {
        this.otro = otro;
    }

    public String getLabelOtro() {
        return labelOtro;
    }

    public void setLabelOtro(String labelOtro) {
        this.labelOtro = labelOtro;
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
    public List<Pregunta> getPreguntaList() {
        return preguntaList;
    }

    public void setPreguntaList(List<Pregunta> preguntaList) {
        this.preguntaList = preguntaList;
    }

    public Pregunta getPreguntaPadre() {
        return preguntaPadre;
    }

    public void setPreguntaPadre(Pregunta preguntaPadre) {
        this.preguntaPadre = preguntaPadre;
    }

    public Encuesta getEncuestaIdencuesta() {
        return encuestaIdencuesta;
    }

    public void setEncuestaIdencuesta(Encuesta encuestaIdencuesta) {
        this.encuestaIdencuesta = encuestaIdencuesta;
    }

    @XmlTransient
    public List<Condicion> getCondicionList() {
        return condicionList;
    }

    public void setCondicionList(List<Condicion> condicionList) {
        this.condicionList = condicionList;
    }

    @XmlTransient
    public List<Condicion> getCondicionList1() {
        return condicionList1;
    }

    public void setCondicionList1(List<Condicion> condicionList1) {
        this.condicionList1 = condicionList1;
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
        hash += (idpregunta != null ? idpregunta.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Pregunta)) {
            return false;
        }
        Pregunta other = (Pregunta) object;
        if ((this.idpregunta == null && other.idpregunta != null) || (this.idpregunta != null && !this.idpregunta.equals(other.idpregunta))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.udec.entidades.Pregunta[ idpregunta=" + idpregunta + " ]";
    }
    
}
