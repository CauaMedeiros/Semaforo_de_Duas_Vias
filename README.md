# Controle de Semáforo de Duas Vias em VHDL

Projeto final desenvolvido para a disciplina de Sistemas Digitais.

## 📝 Descrição

O principal objetivo deste projeto é gerenciar o fluxo de tráfego em um cruzamento de duas vias, evitando colisões através de um controle de tempo preciso e sincronizado entre os dois semáforos. O sistema foi modelado em nível de transferência de registradores (RTL) para simular o comportamento de um semáforo real, garantindo que, enquanto uma via tem o sinal verde, a outra permaneça com o sinal vermelho, com transições seguras indicadas pelo sinal amarelo.

---

## ✨ Funcionalidades Principais

* **Controle de Duas Vias:** Gerencia dois semáforos independentes (Via A e Via B).
* **Máquina de Estados Finitos (FSM):** O controle é baseado em uma FSM que define os estados do semáforo (Verde, Amarelo, Vermelho).
* **Sincronização Segura:** Garante que nunca haverá um sinal verde para ambas as vias simultaneamente.
* **Temporização Ajustável:** Os tempos para cada estado (verde e amarelo) são definidos através de contadores, permitindo simular diferentes fluxos de tráfego. A transição entre os estados considera um tempo de segurança.

---

## 🛠️ Ferramentas Utilizadas

* **Linguagem de Descrição:** VHDL
* **Software de Simulação:** ModelSim - Altera 
* **Placa FPGA:** Altera DE2

---

## 👨‍💻 Autores

Este projeto foi desenvolvido por:

* Cauã Medeiros Pereira - GitHub: CauaMedeiros
* Iwri Simplício Felipe - GitHub: iwri
* Israel
* Julio dos Anjos Lucas Moura - Github: 11ju11
