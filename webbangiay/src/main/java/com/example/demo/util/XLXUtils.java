package com.example.demo.util;

import org.jxls.common.Context;
import org.jxls.util.JxlsHelper;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

public class XLXUtils {

    public void createDocument(OutputStream outStream, String templateName, Map<String, Object> data) {
        String pathTemplateName = ("/templates/").concat(templateName).concat(".xlsx");
        try (InputStream input = this.getClass().getResourceAsStream(pathTemplateName)) {//1

            Context context = new Context();

            for (Map.Entry<String, Object> element : data.entrySet()) { // 2
                context.putVar(element.getKey(), element.getValue());
            }

            JxlsHelper.getInstance().processTemplate(input, outStream, context); // 3

        } catch (Exception exception) {
            exception.printStackTrace();
        } finally {
            closeAndFlushOutput(outStream); // 4
        }
    }

    private void closeAndFlushOutput(OutputStream outStream) {
        try {
            outStream.flush();
            outStream.close();
        } catch (IOException exception) {
            exception.printStackTrace();
        }
    }
}