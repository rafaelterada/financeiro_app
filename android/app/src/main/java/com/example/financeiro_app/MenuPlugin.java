package com.example.financeiro_app;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.sharedpreferences.MethodCallHandlerImpl;
import io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin;

import static android.app.Activity.RESULT_OK;

public class MenuPlugin implements FlutterPlugin, MethodChannel.MethodCallHandler, PluginRegistry.ActivityResultListener, ActivityAware {
    private MethodChannel.Result result;
    private static final String CHANNEL_NAME = "unique.identifier.method/openmenu";
    private MethodChannel channel;
    private Activity activity;

    private void setupChannel(BinaryMessenger messenger, Context context) {
        channel = new MethodChannel(messenger, CHANNEL_NAME);
        channel.setMethodCallHandler(this);
    }

    private void teardownChannel() {
        channel.setMethodCallHandler(null);
        channel = null;
    }

    @Override
    public void onMethodCall(MethodCall call, final MethodChannel.Result result) {
        this.result = result;
        if (call.method.equals("openMenu")) {
            Intent intent = new Intent(activity, MenuActivity.class);
            activity.startActivityForResult(intent, 1);
        }
    }

    @Override
    public boolean onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        if (requestCode == 1){
            if (resultCode == RESULT_OK){
                String action = data.getStringExtra("botao");
                result.success(action);
            }
        }
        return false;
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        setupChannel(binding.getBinaryMessenger(), binding.getApplicationContext());
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        teardownChannel();
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        this.activity = binding.getActivity();
        binding.addActivityResultListener(this);
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
        this.activity = null;
    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
        this.activity = binding.getActivity();
        binding.addActivityResultListener(this);
    }

    @Override
    public void onDetachedFromActivity() {

    }
}
