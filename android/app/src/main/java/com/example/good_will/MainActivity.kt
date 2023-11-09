package com.example.good_will;



import android.util.Log
import android.widget.Toast
import androidx.annotation.NonNull
import com.sabpaisa.gateway.android.sdk.SabPaisaGateway
import com.sabpaisa.gateway.android.sdk.interfaces.IPaymentSuccessCallBack
import com.sabpaisa.gateway.android.sdk.models.TransactionResponsesModel
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.util.Objects

class MainActivity : FlutterActivity(), IPaymentSuccessCallBack<TransactionResponsesModel> {

    private val CHANNEL = "com.sabpaisa.integration/native"
    var resultCallback:MethodChannel.Result?=null
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "callSabPaisaSdk") {
                resultCallback = result

                Toast.makeText(this, "callSabPaisaSdk", Toast.LENGTH_LONG).show()
                val arguments = call.arguments as ArrayList<String>
                val sabPaisaGateway1 =
                    SabPaisaGateway.builder()
                        .setAmount(arguments[4].toDouble())   //Mandatory Parameter
                        .setFirstName(arguments[0]) //Mandatory Parameter
                        .setLastName(arguments[1]) //Mandatory Parameter
                        .setMobileNumber(arguments[3])
                        .setEmailId(arguments[2])//Mandatory Parameter
                        .setSabPaisaPaymentScreen(true)//Mandatory Parameter
                        .setSalutation("")
                        .setClientCode("AMAL72")
                        .setAesApiIv("kEMJWvvU3bXc5sTs")
                        .setAesApiKey("ifCC2MyhqStd75Xc")
                        .setTransUserName("mrxamjad_13158")
                        .setTransUserPassword("AMAL72_SP13158")
                        .build()
                SabPaisaGateway.setInitUrl("https://securepay.sabpaisa.in/SabPaisa/sabPaisaInit?v=1")
                SabPaisaGateway.setEndPointBaseUrl("https://securepay.sabpaisa.in")
                SabPaisaGateway.setTxnEnquiryEndpoint("https://securepay-txnenquiry.sabpaisa.in")


                sabPaisaGateway1.init(this@MainActivity, this)

            } else {
                Toast.makeText(this, "volla", Toast.LENGTH_LONG).show()
            }
        }
    }

    override fun onPaymentFail(message: TransactionResponsesModel?) {
        Log.d("SABPAISA", "Payment Fail")
        val arrayList = ArrayList<String>()
        arrayList.add(message?.status.toString())
        arrayList.add(message?.clientTxnId.toString())
        resultCallback?.success(arrayList)
    }

    override fun onPaymentSuccess(response: TransactionResponsesModel?) {
        Log.d("SABPAISA", "Payment Success${response?.statusCode}")

        val arrayList = ArrayList<String>()
        arrayList.add(response?.status.toString())
        arrayList.add(response?.clientTxnId.toString())
        resultCallback?.success(arrayList)

    }
}
