package com.example.financeiro_app;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.fragment.app.FragmentActivity;

public class MenuActivity extends FragmentActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_menu);

        Button btnAbrirVariacao = findViewById(R.id.btnAbrirVariacao);
        Button btnAbrirGrafico = findViewById(R.id.btnAbrirGrafico);
        Button btnVoltar = findViewById(R.id.btnVoltar);

        btnAbrirVariacao.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent resultIntent = new Intent();
                resultIntent.putExtra("botao", "variacao");
                setResult(RESULT_OK, resultIntent);
                finish();
            }
        });

        btnAbrirGrafico.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent resultIntent = new Intent();
                resultIntent.putExtra("botao", "grafico");
                setResult(RESULT_OK, resultIntent);
                finish();
            }
        });

        btnVoltar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent resultIntent = new Intent();
                resultIntent.putExtra("botao", "voltar");
                setResult(RESULT_OK, resultIntent);
                finish();
            }
        });
    }
}