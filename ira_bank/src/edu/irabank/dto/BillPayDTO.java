/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.irabank.dto;

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
 * @author Ramki Subramanian
 */
@Entity
@Table(name = "bill_pay", catalog = "sbs", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "BillPayDTO.findAll", query = "SELECT b FROM BillPayDTO b"),
    @NamedQuery(name = "BillPayDTO.findByBillId", query = "SELECT b FROM BillPayDTO b WHERE b.billId = :billId"),
    @NamedQuery(name = "BillPayDTO.findByAcctNumber", query = "SELECT b FROM BillPayDTO b WHERE b.acctNumber = :acctNumber"),
    @NamedQuery(name = "BillPayDTO.findByAmount", query = "SELECT b FROM BillPayDTO b WHERE b.amount = :amount"),
    @NamedQuery(name = "BillPayDTO.findByStatus", query = "SELECT b FROM BillPayDTO b WHERE b.status = :status"),
    @NamedQuery(name = "BillPayDTO.findByKey", query = "SELECT b FROM BillPayDTO b WHERE b.key = :key")})
public class BillPayDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "BILL_ID")
    private Integer billId;
    @Size(max = 45)
    @Column(name = "ACCT_NUMBER")
    private String acctNumber;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    private Double amount;
    @Size(max = 45)
    private String status;
    @Size(max = 2048)
    private String key;
    @JoinColumn(name = "MERCHANT_ID", referencedColumnName = "USER_ID")
    @ManyToOne
    private UserDTO merchantId;

    public BillPayDTO() {
    }

    public BillPayDTO(Integer billId) {
        this.billId = billId;
    }

    public Integer getBillId() {
        return billId;
    }

    public void setBillId(Integer billId) {
        this.billId = billId;
    }

    public String getAcctNumber() {
        return acctNumber;
    }

    public void setAcctNumber(String acctNumber) {
        this.acctNumber = acctNumber;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public UserDTO getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(UserDTO merchantId) {
        this.merchantId = merchantId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (billId != null ? billId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof BillPayDTO)) {
            return false;
        }
        BillPayDTO other = (BillPayDTO) object;
        if ((this.billId == null && other.billId != null) || (this.billId != null && !this.billId.equals(other.billId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "edu.irabank.dto.BillPayDTO[ billId=" + billId + " ]";
    }
    
}
