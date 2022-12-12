package com.meet.commoncore.util;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.springframework.util.CollectionUtils;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.*;

/**
 * 邮件工具类
 *
 * @author LD 2022/1/10
 */
public class EmailUtils {

    public static String MY_EMAIL_NAME = "【meet-ui】";
    public static String MY_EMAIL_ACCOUNT = "meet-ui@qq.com";
    public static String MY_EMAIL_PASSWORD = "kfmhatcakmcldccf";
    // 发件人邮箱的 SMTP 服务器地址, 必须准确, 不同邮件服务器地址不同, 一般(只是一般, 绝非绝对)格式为: smtp.xxx.com
    // 网易126邮箱的 SMTP 服务器地址为: smtp.126.com
    public static String MY_EMAIL_SMTP_HOST = "smtp.qq.com";

    /**
     * 发送验证码
     *
     * @param receiveMail 接收人邮箱
     * @param receiveName 接收人名称
     * @return
     * @throws Exception
     */
    public static String sendSecurityCode(String receiveMail, String receiveName) throws Exception {
        HashMap<String, Object> map = Maps.newHashMap();
        List<Map<String, Object>> recipientList = Lists.newArrayList();
        recipientList.add(createTO(receiveMail, receiveName));//接收人
        map.put("recipientList", recipientList);
        map.put("subject", "【meet】");//主题
        String code = CommonUtils.getRandomSixNum();
        String content = "【meet】验证码" + code + "，请勿向他人泄露您的验证码，如非本人操作请忽略本邮件。";
        map.put("content", content);//正文
        EmailUtils.sendMail(map);
        return code;
    }

    /**
     * 发送邮件
     *
     * @param sendContent 发送内容（包括接收人、抄送人、密送人，主题，内容）
     * @throws Exception
     */
    public static void sendMail(Map<String, Object> sendContent) throws Exception {
        // 1. 创建参数配置, 用于连接邮件服务器的参数配置
        Properties props = new Properties();                    // 参数配置
        props.setProperty("mail.transport.protocol", "smtp");   // 使用的协议（JavaMail规范要求）
        props.setProperty("mail.smtp.host", MY_EMAIL_SMTP_HOST);   // 发件人的邮箱的 SMTP 服务器地址
        props.setProperty("mail.smtp.auth", "true");            // 需要请求认证
        // PS: 某些邮箱服务器要求 SMTP 连接需要使用 SSL 安全认证 (为了提高安全性, 邮箱支持SSL连接, 也可以自己开启),
        //     如果无法连接邮件服务器, 仔细查看控制台打印的 log, 如果有有类似 “连接失败, 要求 SSL 安全连接” 等错误,
        //     取消下面 /* ... */ 之间的注释代码, 开启 SSL 安全连接。
        // SMTP 服务器的端口 (非 SSL 连接的端口一般默认为 25, 可以不添加, 如果开启了 SSL 连接,
        //                  需要改为对应邮箱的 SMTP 服务器的端口, 具体可查看对应邮箱服务的帮助,
        //                  QQ邮箱的SMTP(SLL)端口为465或587, 其他邮箱自行去查看)
        /*
        final String smtpPort = "465";
        props.setProperty("mail.smtp.port", smtpPort);
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.socketFactory.port", smtpPort);
        */

        // 2. 根据配置创建会话对象, 用于和邮件服务器交互
        Session session = Session.getInstance(props);
        // 设置为debug模式, 可以查看详细的发送 log
        session.setDebug(true);
        // 3. 创建一封邮件
        MimeMessage message = createMimeMessage(session, MY_EMAIL_ACCOUNT, sendContent);
        // 4. 根据 Session 获取邮件传输对象
        Transport transport = session.getTransport();
        // 5. 使用 邮箱账号 和 密码 连接邮件服务器, 这里认证的邮箱必须与 message 中的发件人邮箱一致, 否则报错
        //
        //    PS_01: 如果连接服务器失败, 都会在控制台输出相应失败原因的log。
        //    仔细查看失败原因, 有些邮箱服务器会返回错误码或查看错误类型的链接,
        //    根据给出的错误类型到对应邮件服务器的帮助网站上查看具体失败原因。
        //
        //    PS_02: 连接失败的原因通常为以下几点, 仔细检查代码:
        //           (1) 邮箱没有开启 SMTP 服务;
        //           (2) 邮箱密码错误, 例如某些邮箱开启了独立密码;
        //           (3) 邮箱服务器要求必须要使用 SSL 安全连接;
        //           (4) 请求过于频繁或其他原因, 被邮件服务器拒绝服务;
        //           (5) 如果以上几点都确定无误, 到邮件服务器网站查找帮助。
        //
        transport.connect(MY_EMAIL_ACCOUNT, MY_EMAIL_PASSWORD);
        // 6. 发送邮件, 发到所有的收件地址, message.getAllRecipients() 获取到的是在创建邮件对象时添加的所有收件人, 抄送人, 密送人
        transport.sendMessage(message, message.getAllRecipients());
        // 7. 关闭连接
        transport.close();
    }

    /**
     * 创建一封只包含文本的简单邮件
     *
     * @param session     和服务器交互的会话
     * @param sendMail    发件人邮箱
     * @param sendContent 发送内容（包括接收人、抄送人、密送人，主题，内容）
     * @return
     * @throws Exception
     */
    public static MimeMessage createMimeMessage(Session session, String sendMail, Map<String, Object> sendContent) throws Exception {
        // 1. 创建一封邮件
        MimeMessage message = new MimeMessage(session);
        // 2. From: 发件人
        message.setFrom(new InternetAddress(sendMail, MY_EMAIL_NAME, "UTF-8"));
        // 3. To: 收件人（可以增加多个收件人、抄送、密送）
        List<Map<String, Object>> recipientList = (List<Map<String, Object>>) sendContent.get("recipientList");
        if (!CollectionUtils.isEmpty(recipientList)) {
            for (Map<String, Object> recipient : recipientList) {
                message.addRecipient((Message.RecipientType) recipient.get("receiveType"), new InternetAddress(String.valueOf(recipient.get("receiveMail")), String.valueOf(recipient.get("receiveName")), "UTF-8"));
            }
        }
        //    To: 增加收件人（可选）
        //message.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress("dd@receive.com", "USER_DD", "UTF-8"));
        //    Cc: 抄送（可选）
        //message.setRecipient(MimeMessage.RecipientType.CC, new InternetAddress("ee@receive.com", "USER_EE", "UTF-8"));
        //    Bcc: 密送（可选）
        //message.setRecipient(MimeMessage.RecipientType.BCC, new InternetAddress("ff@receive.com", "USER_FF", "UTF-8"));
        // 4. Subject: 邮件主题
        message.setSubject(String.valueOf(sendContent.get("subject")), "UTF-8");
        // 5. Content: 邮件正文（可以使用html标签）
        message.setContent(sendContent.get("content"), "text/html;charset=UTF-8");
        // 6. 设置发件时间
        message.setSentDate(new Date());
        // 7. 保存设置
        message.saveChanges();
        return message;
    }

    /**
     * 创建接收人
     *
     * @param receiveMail
     * @param receiveName
     * @return
     */
    public static Map<String, Object> createTO(String receiveMail, String receiveName) {
        HashMap<String, Object> recipient = Maps.newHashMap();
        recipient.put("receiveType", MimeMessage.RecipientType.TO);//接收人类型
        recipient.put("receiveMail", receiveMail);//接收人邮箱
        recipient.put("receiveName", receiveName);//接收人名称
        return recipient;
    }

    /**
     * 创建抄送人
     *
     * @param receiveMail
     * @param receiveName
     * @return
     */
    public static Map<String, Object> createCC(String receiveMail, String receiveName) {
        HashMap<String, Object> recipient = Maps.newHashMap();
        recipient.put("receiveType", MimeMessage.RecipientType.CC);//接收人类型
        recipient.put("receiveMail", receiveMail);//接收人邮箱
        recipient.put("receiveName", receiveName);//接收人名称
        return recipient;
    }

    /**
     * 创建密送人
     *
     * @param receiveMail
     * @param receiveName
     * @return
     */
    public static Map<String, Object> createBCC(String receiveMail, String receiveName) {
        HashMap<String, Object> recipient = Maps.newHashMap();
        recipient.put("receiveType", MimeMessage.RecipientType.BCC);//接收人类型
        recipient.put("receiveMail", receiveMail);//接收人邮箱
        recipient.put("receiveName", receiveName);//接收人名称
        return recipient;
    }

    public static void main(String[] args) throws Exception {
        HashMap<String, Object> map = Maps.newHashMap();
        ArrayList<Map<String, Object>> recipientList = Lists.newArrayList();
        recipientList.add(createTO("473932705@qq.com", "妖姬"));//接收人
        recipientList.add(createTO("964708273@qq.com", "霸王"));//接收人
        recipientList.add(createCC("473932705@qq.com", "妖姬"));//抄送人
        recipientList.add(createBCC("473932705@qq.com", "妖姬"));//密送人
        map.put("recipientList", recipientList);
        map.put("subject", "【验证码】");//主题
        map.put("content", "20220110");//正文
        EmailUtils.sendMail(map);
    }
}
