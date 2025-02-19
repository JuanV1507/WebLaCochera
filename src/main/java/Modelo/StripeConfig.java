package Config;

import com.stripe.Stripe;

public class StripeConfig {
    public static void configure() {
        Stripe.apiKey = "sk_test_51Qnae6RFM3OuQco00El8QL51l5hdSnWueM6zyWAjRwdK25OTM6sHXGwGLVOch7BFkgVFZblC5PmchffTMUnaCCrj00p8mBdzwa";
          System.out.println("Clave de Stripe configurada correctamente: " + Stripe.apiKey);// Reemplaza con tu clave secreta de Stripe
    }
}
