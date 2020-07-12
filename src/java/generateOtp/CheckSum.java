/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package generateOtp;

/**
 *
 * @author Harshit
 */

import java.util.TreeMap;

public class CheckSum 
{

    private static CheckSum checkSumServiceHelper;

    private CheckSum() {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: invokespecial java/lang/Object."<init>":()V
         * 4: return
         *  */
        // </editor-fold>
    }

    public static String getVersion() 
    {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: ldc           1.0
         * 2: areturn
         *  */
        // </editor-fold>
    }

    public static CheckSum getCheckSumServiceHelper() 
    {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: getstatic     com/paytm/merchant/CheckSumServiceHelper.checkSumServiceHelper:Lcom/paytm/merchant/CheckSumServiceHelper;
         * 3: ifnonnull     16
         * 6: new           com/paytm/merchant/CheckSumServiceHelper
         * 9: dup
         * 10: invokespecial com/paytm/merchant/CheckSumServiceHelper."<init>":()V
         * 13: putstatic     com/paytm/merchant/CheckSumServiceHelper.checkSumServiceHelper:Lcom/paytm/merchant/CheckSumServiceHelper;
         * 16: getstatic     com/paytm/merchant/CheckSumServiceHelper.checkSumServiceHelper:Lcom/paytm/merchant/CheckSumServiceHelper;
         * 19: areturn
         *  */
        // </editor-fold>
    }

    public String genrateCheckSum(String Key, TreeMap<String, String> paramap) throws Exception 
    {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: getstatic     com/paytm/merchant/CheckSumServiceHelper.checkSumServiceHelper:Lcom/paytm/merchant/CheckSumServiceHelper;
         * 3: aload_2
         * 4: invokevirtual com/paytm/merchant/CheckSumServiceHelper.getCheckSumString:(Ljava/util/TreeMap;)Ljava/lang/StringBuilder;
         * 7: astore_3
         * 8: aconst_null
         * 9: astore        4
         * 11: ldc           AES
         * 13: invokestatic  com/paytm/crypto/EncryptionFactory.getEncryptionInstance:(Ljava/lang/String;)Lcom/paytm/crypto/Encryption;
         * 16: astore        5
         * 18: iconst_4
         * 19: invokestatic  com/paytm/crypto/CryptoUtils.generateRandomString:(I)Ljava/lang/String;
         * 22: astore        6
         * 24: aload_3
         * 25: aload         6
         * 27: invokevirtual java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
         * 30: pop
         * 31: aload_3
         * 32: invokevirtual java/lang/StringBuilder.toString:()Ljava/lang/String;
         * 35: invokestatic  com/paytm/crypto/CryptoUtils.getSHA256:(Ljava/lang/String;)Ljava/lang/String;
         * 38: astore        7
         * 40: aload         7
         * 42: aload         6
         * 44: invokevirtual java/lang/String.concat:(Ljava/lang/String;)Ljava/lang/String;
         * 47: astore        7
         * 49: aload         5
         * 51: aload         7
         * 53: aload_1
         * 54: invokeinterface com/paytm/crypto/Encryption.encrypt:(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
         * 59: astore        4
         * 61: aload         4
         * 63: ifnull        109
         * 66: aload         4
         * 68: ldc           \r\n
         * 70: ldc
         * 72: invokevirtual java/lang/String.replaceAll:(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
         * 75: astore        4
         * 77: aload         4
         * 79: ldc           \r
         * 81: ldc
         * 83: invokevirtual java/lang/String.replaceAll:(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
         * 86: astore        4
         * 88: aload         4
         * 90: ldc           \n
         * 92: ldc
         * 94: invokevirtual java/lang/String.replaceAll:(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
         * 97: astore        4
         * 99: goto          109
         * 102: astore        5
         * 104: aload         5
         * 106: invokevirtual java/lang/SecurityException.printStackTrace:()V
         * 109: aload         4
         * 111: areturn
         * Exception table:
         * from    to  target type
         * 11    99   102   Class java/lang/SecurityException
         *  */
        // </editor-fold>
    }

    public StringBuilder getCheckSumString(TreeMap<String, String> paramMap) throws Exception 
    {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_1
         * 1: invokevirtual java/util/TreeMap.keySet:()Ljava/util/Set;
         * 4: astore_2
         * 5: new           java/lang/StringBuilder
         * 8: dup
         * 9: ldc
         * 11: invokespecial java/lang/StringBuilder."<init>":(Ljava/lang/String;)V
         * 14: astore_3
         * 15: new           java/util/TreeSet
         * 18: dup
         * 19: invokespecial java/util/TreeSet."<init>":()V
         * 22: astore        4
         * 24: aload_2
         * 25: invokeinterface java/util/Set.iterator:()Ljava/util/Iterator;
         * 30: astore        6
         * 32: goto          65
         * 35: aload         6
         * 37: invokeinterface java/util/Iterator.next:()Ljava/lang/Object;
         * 42: checkcast     java/lang/String
         * 45: astore        5
         * 47: ldc           CHECKSUMHASH
         * 49: aload         5
         * 51: invokevirtual java/lang/String.equalsIgnoreCase:(Ljava/lang/String;)Z
         * 54: ifne          65
         * 57: aload         4
         * 59: aload         5
         * 61: invokevirtual java/util/TreeSet.add:(Ljava/lang/Object;)Z
         * 64: pop
         * 65: aload         6
         * 67: invokeinterface java/util/Iterator.hasNext:()Z
         * 72: ifne          35
         * 75: aload         4
         * 77: invokevirtual java/util/TreeSet.iterator:()Ljava/util/Iterator;
         * 80: astore        6
         * 82: goto          145
         * 85: aload         6
         * 87: invokeinterface java/util/Iterator.next:()Ljava/lang/Object;
         * 92: checkcast     java/lang/String
         * 95: astore        5
         * 97: aload_1
         * 98: aload         5
         * 100: invokevirtual java/util/TreeMap.get:(Ljava/lang/Object;)Ljava/lang/Object;
         * 103: checkcast     java/lang/String
         * 106: astore        7
         * 108: aload         7
         * 110: ifnull        126
         * 113: aload         7
         * 115: invokevirtual java/lang/String.trim:()Ljava/lang/String;
         * 118: ldc           NULL
         * 120: invokevirtual java/lang/String.equalsIgnoreCase:(Ljava/lang/String;)Z
         * 123: ifeq          130
         * 126: ldc
         * 128: astore        7
         * 130: aload_3
         * 131: aload         7
         * 133: invokevirtual java/lang/String.trim:()Ljava/lang/String;
         * 136: invokevirtual java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
         * 139: ldc           |
         * 141: invokevirtual java/lang/StringBuilder.append:(Ljava/lang/String;)Ljava/lang/StringBuilder;
         * 144: pop
         * 145: aload         6
         * 147: invokeinterface java/util/Iterator.hasNext:()Z
         * 152: ifne          85
         * 155: aload_3
         * 156: areturn
         *  */
        // </editor-fold>
    }

    public boolean verifycheckSum(String masterKey, TreeMap<String, String> paramap, String responseCheckSumString) throws Exception 
    {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: iconst_0
         * 1: istore        4
         * 3: getstatic     com/paytm/merchant/CheckSumServiceHelper.checkSumServiceHelper:Lcom/paytm/merchant/CheckSumServiceHelper;
         * 6: aload_2
         * 7: invokevirtual com/paytm/merchant/CheckSumServiceHelper.getCheckSumString:(Ljava/util/TreeMap;)Ljava/lang/StringBuilder;
         * 10: astore        5
         * 12: ldc           AES
         * 14: invokestatic  com/paytm/crypto/EncryptionFactory.getEncryptionInstance:(Ljava/lang/String;)Lcom/paytm/crypto/Encryption;
         * 17: astore        6
         * 19: aload         6
         * 21: aload_3
         * 22: aload_1
         * 23: invokeinterface com/paytm/crypto/Encryption.decrypt:(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
         * 28: astore        7
         * 30: aload         7
         * 32: iconst_4
         * 33: invokestatic  com/paytm/merchant/CheckSumServiceHelper.getLastNChars:(Ljava/lang/String;I)Ljava/lang/String;
         * 36: astore        8
         * 38: aload_0
         * 39: aload         8
         * 41: aload         5
         * 43: invokevirtual java/lang/StringBuilder.toString:()Ljava/lang/String;
         * 46: invokespecial com/paytm/merchant/CheckSumServiceHelper.calculateRequestCheckSum:(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
         * 49: astore        9
         * 51: aload         7
         * 53: ifnull        74
         * 56: aload         9
         * 58: ifnull        74
         * 61: aload         7
         * 63: aload         9
         * 65: invokevirtual java/lang/String.equals:(Ljava/lang/Object;)Z
         * 68: ifeq          74
         * 71: iconst_1
         * 72: istore        4
         * 74: iload         4
         * 76: ireturn
         *  */
        // </editor-fold>
    }

    private String calculateRequestCheckSum(String randomStr, String checkSumString) throws Exception 
    {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_2
         * 1: astore_3
         * 2: aload_3
         * 3: aload_1
         * 4: invokevirtual java/lang/String.concat:(Ljava/lang/String;)Ljava/lang/String;
         * 7: invokestatic  com/paytm/crypto/CryptoUtils.getSHA256:(Ljava/lang/String;)Ljava/lang/String;
         * 10: astore        4
         * 12: aload         4
         * 14: aload_1
         * 15: invokevirtual java/lang/String.concat:(Ljava/lang/String;)Ljava/lang/String;
         * 18: astore        4
         * 20: aload         4
         * 22: areturn
         *  */
        // </editor-fold>
    }

    public static String getLastNChars(String inputString, int subStringLength) 
    {
        // <editor-fold defaultstate="collapsed" desc="Compiled Code">
        /* 0: aload_0
         * 1: ifnull        33
         * 4: aload_0
         * 5: invokevirtual java/lang/String.length:()I
         * 8: ifle          33
         * 11: aload_0
         * 12: invokevirtual java/lang/String.length:()I
         * 15: istore_2
         * 16: iload_2
         * 17: iload_1
         * 18: if_icmpgt     23
         * 21: aload_0
         * 22: areturn
         * 23: iload_2
         * 24: iload_1
         * 25: isub
         * 26: istore_3
         * 27: aload_0
         * 28: iload_3
         * 29: invokevirtual java/lang/String.substring:(I)Ljava/lang/String;
         * 32: areturn
         * 33: ldc
         * 35: areturn
         *  */
        // </editor-fold>
    }
}
