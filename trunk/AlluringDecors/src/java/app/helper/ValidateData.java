/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package app.helper;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Admin
 */
public class ValidateData {
    private static ValidateData instance = null;
    private static final String INTEGER = "^-?\\d+$";
    private static final String NUMBER = "^-?\\d*\\.?\\d+$";
    private static final String EMAIL = "^[\\w._%+-]+@([\\w-]+\\.){1,4}[A-Za-z]{2,4}$";
    private static final String PHONE_NUM = "^0[1-9]{1,4}\\d{8}$";
    private Matcher m = null;
    private Pattern p = null;
    public static ValidateData getInstance() {
        if (instance == null) {
            instance = new ValidateData();
        }
        return instance;
    }

    public boolean  checkIsPhone(String strPhone) {
        Pattern regx = Pattern.compile(PHONE_NUM);
        m = regx.matcher(strPhone);
        if (m.find()) {
            return true;
        } else {
            return false;
        }
    }

    public boolean checkIsNumber(String strNumber) {
        Pattern regx = Pattern.compile(INTEGER);
        m = regx.matcher(strNumber);
        if (m.find()) {
            return true;
        } else {
            return false;
        }
    }

    public boolean checkIsMoney(String strMoney) {
        Pattern regx = Pattern.compile(NUMBER);
        m = regx.matcher(strMoney);
        if (m.find()) {
            return true;
        } else {
            return false;
        }
    }

    public boolean checkIsDate(String strDate) {
        return true;
    }

    public boolean checkIsEmail(String strEmail) {
        Pattern regx = Pattern.compile(EMAIL);
        m = regx.matcher(strEmail);
        if (m.find()) {
            return true;
        } else {
            return false;
        }
    }
}
