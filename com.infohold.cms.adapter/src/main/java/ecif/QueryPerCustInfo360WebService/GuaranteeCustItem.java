
package ecif.QueryPerCustInfo360WebService;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlSchemaType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.datatype.XMLGregorianCalendar;


/**
 * <p>Java class for guaranteeCustItem complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="guaranteeCustItem">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="company_address" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="company_duties" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="company_name" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="company_postcode" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="company_tel" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="company_type" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_city" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_country" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_education" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_hobbies" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_live_address" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_marstat" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_postcode" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_profession" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="cust_province" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="family_income" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="graduate_date" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="graduate_school" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="guarantee_id" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="job_startdate" type="{http://www.w3.org/2001/XMLSchema}dateTime" minOccurs="0"/>
 *         &lt;element name="job_title" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="job_type" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="monthly_income" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="partner_cert_no" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="partner_cert_type" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="partner_job" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="partner_name" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="reterence" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="salary_account" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="salary_bank" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "guaranteeCustItem", propOrder = {
    "companyAddress",
    "companyDuties",
    "companyName",
    "companyPostcode",
    "companyTel",
    "companyType",
    "custCity",
    "custCountry",
    "custEducation",
    "custHobbies",
    "custLiveAddress",
    "custMarstat",
    "custPostcode",
    "custProfession",
    "custProvince",
    "familyIncome",
    "graduateDate",
    "graduateSchool",
    "guaranteeId",
    "jobStartdate",
    "jobTitle",
    "jobType",
    "monthlyIncome",
    "partnerCertNo",
    "partnerCertType",
    "partnerJob",
    "partnerName",
    "reterence",
    "salaryAccount",
    "salaryBank"
})
public class GuaranteeCustItem {

    @XmlElement(name = "company_address")
    protected String companyAddress;
    @XmlElement(name = "company_duties")
    protected String companyDuties;
    @XmlElement(name = "company_name")
    protected String companyName;
    @XmlElement(name = "company_postcode")
    protected String companyPostcode;
    @XmlElement(name = "company_tel")
    protected String companyTel;
    @XmlElement(name = "company_type")
    protected String companyType;
    @XmlElement(name = "cust_city")
    protected String custCity;
    @XmlElement(name = "cust_country")
    protected String custCountry;
    @XmlElement(name = "cust_education")
    protected String custEducation;
    @XmlElement(name = "cust_hobbies")
    protected String custHobbies;
    @XmlElement(name = "cust_live_address")
    protected String custLiveAddress;
    @XmlElement(name = "cust_marstat")
    protected String custMarstat;
    @XmlElement(name = "cust_postcode")
    protected String custPostcode;
    @XmlElement(name = "cust_profession")
    protected String custProfession;
    @XmlElement(name = "cust_province")
    protected String custProvince;
    @XmlElement(name = "family_income")
    protected String familyIncome;
    @XmlElement(name = "graduate_date")
    protected String graduateDate;
    @XmlElement(name = "graduate_school")
    protected String graduateSchool;
    @XmlElement(name = "guarantee_id")
    protected String guaranteeId;
    @XmlElement(name = "job_startdate")
    @XmlSchemaType(name = "dateTime")
    protected XMLGregorianCalendar jobStartdate;
    @XmlElement(name = "job_title")
    protected String jobTitle;
    @XmlElement(name = "job_type")
    protected String jobType;
    @XmlElement(name = "monthly_income")
    protected String monthlyIncome;
    @XmlElement(name = "partner_cert_no")
    protected String partnerCertNo;
    @XmlElement(name = "partner_cert_type")
    protected String partnerCertType;
    @XmlElement(name = "partner_job")
    protected String partnerJob;
    @XmlElement(name = "partner_name")
    protected String partnerName;
    protected String reterence;
    @XmlElement(name = "salary_account")
    protected String salaryAccount;
    @XmlElement(name = "salary_bank")
    protected String salaryBank;

    /**
     * Gets the value of the companyAddress property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCompanyAddress() {
        return companyAddress;
    }

    /**
     * Sets the value of the companyAddress property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCompanyAddress(String value) {
        this.companyAddress = value;
    }

    /**
     * Gets the value of the companyDuties property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCompanyDuties() {
        return companyDuties;
    }

    /**
     * Sets the value of the companyDuties property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCompanyDuties(String value) {
        this.companyDuties = value;
    }

    /**
     * Gets the value of the companyName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCompanyName() {
        return companyName;
    }

    /**
     * Sets the value of the companyName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCompanyName(String value) {
        this.companyName = value;
    }

    /**
     * Gets the value of the companyPostcode property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCompanyPostcode() {
        return companyPostcode;
    }

    /**
     * Sets the value of the companyPostcode property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCompanyPostcode(String value) {
        this.companyPostcode = value;
    }

    /**
     * Gets the value of the companyTel property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCompanyTel() {
        return companyTel;
    }

    /**
     * Sets the value of the companyTel property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCompanyTel(String value) {
        this.companyTel = value;
    }

    /**
     * Gets the value of the companyType property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCompanyType() {
        return companyType;
    }

    /**
     * Sets the value of the companyType property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCompanyType(String value) {
        this.companyType = value;
    }

    /**
     * Gets the value of the custCity property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustCity() {
        return custCity;
    }

    /**
     * Sets the value of the custCity property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustCity(String value) {
        this.custCity = value;
    }

    /**
     * Gets the value of the custCountry property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustCountry() {
        return custCountry;
    }

    /**
     * Sets the value of the custCountry property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustCountry(String value) {
        this.custCountry = value;
    }

    /**
     * Gets the value of the custEducation property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustEducation() {
        return custEducation;
    }

    /**
     * Sets the value of the custEducation property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustEducation(String value) {
        this.custEducation = value;
    }

    /**
     * Gets the value of the custHobbies property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustHobbies() {
        return custHobbies;
    }

    /**
     * Sets the value of the custHobbies property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustHobbies(String value) {
        this.custHobbies = value;
    }

    /**
     * Gets the value of the custLiveAddress property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustLiveAddress() {
        return custLiveAddress;
    }

    /**
     * Sets the value of the custLiveAddress property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustLiveAddress(String value) {
        this.custLiveAddress = value;
    }

    /**
     * Gets the value of the custMarstat property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustMarstat() {
        return custMarstat;
    }

    /**
     * Sets the value of the custMarstat property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustMarstat(String value) {
        this.custMarstat = value;
    }

    /**
     * Gets the value of the custPostcode property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustPostcode() {
        return custPostcode;
    }

    /**
     * Sets the value of the custPostcode property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustPostcode(String value) {
        this.custPostcode = value;
    }

    /**
     * Gets the value of the custProfession property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustProfession() {
        return custProfession;
    }

    /**
     * Sets the value of the custProfession property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustProfession(String value) {
        this.custProfession = value;
    }

    /**
     * Gets the value of the custProvince property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getCustProvince() {
        return custProvince;
    }

    /**
     * Sets the value of the custProvince property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setCustProvince(String value) {
        this.custProvince = value;
    }

    /**
     * Gets the value of the familyIncome property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getFamilyIncome() {
        return familyIncome;
    }

    /**
     * Sets the value of the familyIncome property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setFamilyIncome(String value) {
        this.familyIncome = value;
    }

    /**
     * Gets the value of the graduateDate property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getGraduateDate() {
        return graduateDate;
    }

    /**
     * Sets the value of the graduateDate property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setGraduateDate(String value) {
        this.graduateDate = value;
    }

    /**
     * Gets the value of the graduateSchool property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getGraduateSchool() {
        return graduateSchool;
    }

    /**
     * Sets the value of the graduateSchool property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setGraduateSchool(String value) {
        this.graduateSchool = value;
    }

    /**
     * Gets the value of the guaranteeId property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getGuaranteeId() {
        return guaranteeId;
    }

    /**
     * Sets the value of the guaranteeId property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setGuaranteeId(String value) {
        this.guaranteeId = value;
    }

    /**
     * Gets the value of the jobStartdate property.
     * 
     * @return
     *     possible object is
     *     {@link XMLGregorianCalendar }
     *     
     */
    public XMLGregorianCalendar getJobStartdate() {
        return jobStartdate;
    }

    /**
     * Sets the value of the jobStartdate property.
     * 
     * @param value
     *     allowed object is
     *     {@link XMLGregorianCalendar }
     *     
     */
    public void setJobStartdate(XMLGregorianCalendar value) {
        this.jobStartdate = value;
    }

    /**
     * Gets the value of the jobTitle property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getJobTitle() {
        return jobTitle;
    }

    /**
     * Sets the value of the jobTitle property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setJobTitle(String value) {
        this.jobTitle = value;
    }

    /**
     * Gets the value of the jobType property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getJobType() {
        return jobType;
    }

    /**
     * Sets the value of the jobType property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setJobType(String value) {
        this.jobType = value;
    }

    /**
     * Gets the value of the monthlyIncome property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getMonthlyIncome() {
        return monthlyIncome;
    }

    /**
     * Sets the value of the monthlyIncome property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setMonthlyIncome(String value) {
        this.monthlyIncome = value;
    }

    /**
     * Gets the value of the partnerCertNo property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPartnerCertNo() {
        return partnerCertNo;
    }

    /**
     * Sets the value of the partnerCertNo property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPartnerCertNo(String value) {
        this.partnerCertNo = value;
    }

    /**
     * Gets the value of the partnerCertType property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPartnerCertType() {
        return partnerCertType;
    }

    /**
     * Sets the value of the partnerCertType property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPartnerCertType(String value) {
        this.partnerCertType = value;
    }

    /**
     * Gets the value of the partnerJob property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPartnerJob() {
        return partnerJob;
    }

    /**
     * Sets the value of the partnerJob property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPartnerJob(String value) {
        this.partnerJob = value;
    }

    /**
     * Gets the value of the partnerName property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPartnerName() {
        return partnerName;
    }

    /**
     * Sets the value of the partnerName property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPartnerName(String value) {
        this.partnerName = value;
    }

    /**
     * Gets the value of the reterence property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getReterence() {
        return reterence;
    }

    /**
     * Sets the value of the reterence property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setReterence(String value) {
        this.reterence = value;
    }

    /**
     * Gets the value of the salaryAccount property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSalaryAccount() {
        return salaryAccount;
    }

    /**
     * Sets the value of the salaryAccount property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSalaryAccount(String value) {
        this.salaryAccount = value;
    }

    /**
     * Gets the value of the salaryBank property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getSalaryBank() {
        return salaryBank;
    }

    /**
     * Sets the value of the salaryBank property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setSalaryBank(String value) {
        this.salaryBank = value;
    }

}
