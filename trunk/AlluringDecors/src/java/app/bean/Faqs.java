package app.bean;
// Generated Feb 26, 2011 1:22:36 PM by Hibernate Tools 3.2.1.GA



/**
 * Faqs generated by hbm2java
 */
public class Faqs  implements java.io.Serializable {


     private int faqsid;
     private String question;
     private String answer;
     private Integer visiable;

    public Faqs() {
    }

	
    public Faqs(int faqsid, String question, String answer) {
        this.faqsid = faqsid;
        this.question = question;
        this.answer = answer;
    }
    public Faqs(int faqsid, String question, String answer, Integer visiable) {
       this.faqsid = faqsid;
       this.question = question;
       this.answer = answer;
       this.visiable = visiable;
    }
   
    public int getFaqsid() {
        return this.faqsid;
    }
    
    public void setFaqsid(int faqsid) {
        this.faqsid = faqsid;
    }
    public String getQuestion() {
        return this.question;
    }
    
    public void setQuestion(String question) {
        this.question = question;
    }
    public String getAnswer() {
        return this.answer;
    }
    
    public void setAnswer(String answer) {
        this.answer = answer;
    }
    public Integer getVisiable() {
        return this.visiable;
    }
    
    public void setVisiable(Integer visiable) {
        this.visiable = visiable;
    }




}


