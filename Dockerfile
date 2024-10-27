# Use the official Python image
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy requirements.txt
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY ./app /app

# Copy notebooks
COPY ./notebooks /notebooks

# Expose Streamlit and Jupyter ports
EXPOSE 8501
EXPOSE 8888

# Command to run the Streamlit app by default
CMD ["streamlit", "run", "app.py"]
