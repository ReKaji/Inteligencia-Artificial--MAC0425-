# Descrição

Este repositório reúne os trabalhos e experimentos desenvolvidos para a disciplina "Inteligência Artificial (MAC0425)". Cada pasta contém o enunciado, código e notebooks utilizados para implementar soluções em lógica simbólica e aprendizagem de máquina. Os projetos estão organizados para evidenciar competências relevantes em engenharia de software e ciência de dados: modelagem, engenharia de features, experimentação reprodutível e implementação de modelos em código limpo e comentado.

---

## Sumário dos projetos

Abaixo há uma visão por projeto, descrevendo o que foi feito, as tecnologias empregadas e os pontos técnicos que merecem destaque.

### EP1 — Programação lógica

- O que faz

	Implementações em Prolog que resolvem problemas clássicos de raciocínio lógico e busca. Os arquivos contêm predicados, regras e exemplos de consulta para verificar propriedades e executar inferências.

- Tecnologias e arquivos

	- Linguagem: Prolog (arquivos `.pro`).
	- Local: `EP1- Prolog/` (contém `ep1A.pro`, `ep1B.pro` e cópias no subdiretório `enunciado-ep1-2025/`).

- Destaques técnicos

	- Modelagem lógica de problemas: uso de recursão, unificação e backtracking.
	- Escrita de predicados reutilizáveis e testes por consultas interativas.
	- Organização do código para facilitar leitura e revisão por pares.

- Como executar

	Recomenda-se utilizar o interpretador SWI-Prolog (ou compatível): carregar o arquivo e executar as consultas descritas nos comentários dos arquivos `.pro`.

### EP2 — Classificação com redes neurais

- O que faz

	Pipeline completo de classificação baseado em aprendizado profundo para um conjunto de exames clínicos (pré-processamento, engenharia de features, definição e treino de redes neurais, validação e análise de métricas). O objetivo foi preparar os dados, treinar modelos e analisar desempenho com boas práticas de experimentação.

- Tecnologias e arquivos

	- Linguagem: Python (notebooks Jupyter).
	- Principais bibliotecas: NumPy, Pandas, scikit-learn, PyTorch, torchvision, Matplotlib/Seaborn.
	- Organização:
		- `EP2 - Classificação com Redes Neurais/PRE/` — notebooks de pré-processamento (`Pre_Processamento.ipynb`) e o dataset `covid_exams_final.csv`.
		- `EP2 - Classificação com Redes Neurais/NN/` — notebook de definição, treino e avaliação da rede (`Neural_Network.ipynb`).

- Como executar (resumo)

	1. Criar um ambiente Python (recomendado: venv ou conda).

		 ```bash
		 python -m venv .venv
		 source .venv/bin/activate
		 pip install -U pip
		 pip install numpy pandas scikit-learn torch torchvision matplotlib seaborn jupyter
		 ```

	2. Abrir os notebooks com Jupyter Lab/Notebook e executar as células na ordem indicada (primeiro pré-processamento em `PRE/`, depois `NN/`).

		 - O notebook de pré-processamento gera os datasets limpos prontos para treino.
		 - O notebook de `NN` contém a definição da rede, loops de treino e avaliação com K-Fold.

	3. Se disponível, use GPU para acelerar treino (PyTorch detecta automaticamente se CUDA está disponível).

- Resultados e interpretação

	- Os notebooks documentam as escolhas de arquitetura e hiperparâmetros, mostram visualizações (distribuições, matrizes de confusão) e discutem trade-offs entre modelos simples e modelos mais profundos.
	- O foco foi entender erros do modelo, priorizar métricas relevantes ao domínio e documentar como as decisões de pré-processamento impactam o desempenho.

