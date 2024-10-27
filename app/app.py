import streamlit as st
import requests

# Elasticsearch configuration
ELASTICSEARCH_URL = "http://elasticsearch:9200"

st.title("Ragtime: RAG System for SQuAD")

def query_elasticsearch(question):
    query = {
        "query": {
            "match": {
                "question": question
            }
        }
    }
    response = requests.get(f"{ELASTICSEARCH_URL}/squad/_search", json=query)
    return response.json()

question = st.text_input("Ask a question about the SQuAD dataset:")

if st.button("Submit"):
    if question:
        response = query_elasticsearch(question)
        st.write(response)
    else:
        st.write("Please enter a question.")
