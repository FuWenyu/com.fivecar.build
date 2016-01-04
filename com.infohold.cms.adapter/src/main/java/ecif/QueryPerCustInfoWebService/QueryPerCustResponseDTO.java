
package ecif.QueryPerCustInfoWebService;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java class for queryPerCustResponseDTO complex type.
 * 
 * <p>The following schema fragment specifies the expected content contained within this class.
 * 
 * <pre>
 * &lt;complexType name="queryPerCustResponseDTO">
 *   &lt;complexContent>
 *     &lt;extension base="{http://webservice.service.ecif.infohold.com/}commonResponseDTO">
 *       &lt;sequence>
 *         &lt;element name="list" type="{http://webservice.service.ecif.infohold.com/}queryPerCustItem" maxOccurs="unbounded" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/extension>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "queryPerCustResponseDTO", propOrder = {
    "list"
})
public class QueryPerCustResponseDTO
    extends CommonResponseDTO
{

    @XmlElement(nillable = true)
    protected List<QueryPerCustItem> list;

    /**
     * Gets the value of the list property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the list property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getList().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link QueryPerCustItem }
     * 
     * 
     */
    public List<QueryPerCustItem> getList() {
        if (list == null) {
            list = new ArrayList<QueryPerCustItem>();
        }
        return this.list;
    }

}
