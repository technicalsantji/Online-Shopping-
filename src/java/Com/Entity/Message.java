/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Com.Entity;
public class Message {
    private String content,type,cssclass;

    public Message(String content, String type, String cssclass) {
        this.content = content;
        this.type = type;
        this.cssclass = cssclass;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCssclass() {
        return cssclass;
    }

    public void setCssclass(String cssclass) {
        this.cssclass = cssclass;
    }
    
    
}
