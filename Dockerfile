# Use the official Python image
FROM python:3.13-slim

# Set the working directory
WORKDIR /app

# Copy Pipfile and Pipfile.lock
COPY Pipfile* ./

# Install Pipenv
RUN pip install pipenv

# Install dependencies
RUN pipenv install --deploy --ignore-pipfile

# Install Jupyter
RUN pipenv run pip install jupyter

# Copy the application code
COPY ./app /app

# Copy notebooks
COPY ./notebooks /notebooks

# Expose Streamlit port
EXPOSE 8501

# Expose Jupyter port
EXPOSE 8888

# Command to run the app
CMD ["pipenv", "run", "streamlit", "run", "app.py"]
