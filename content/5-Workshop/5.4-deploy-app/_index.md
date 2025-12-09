---
title : "Deploy Application"
date : 2025-11-18
weight : 4
chapter : false
pre : " <b> 5.4. </b> "
---

We will use the Terminal on your local machine to SSH into the EC2 and install the application.

#### 1. SSH Connection
Open Terminal in the directory containing your `.pem` key file and run the following commands (replace the DNS/IP with your actual address):

```bash
# Set permission for key file (Linux/Mac only)
chmod 400 workshop-aws-streamlit.pem

# SSH Connection
ssh -i "workshop-aws-streamlit.pem" ubuntu@<Your-Public-IPv4-DNS>
```

![SSH Connection](/images/5-Workshop/5.4-Deploy-App/ssh.png)

#### 2. Install Environment

Once connected, run the following commands to clone the code and install dependencies:

```bash
cd ~
# Clone source code
git clone https://github.com/Ntthuhoai/Workshop-AWS.git

# Navigate to project directory
cd Workshop-AWS/Credit_Card_Customers

# Create virtual environment and install requirements
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
```

![Install Dependencies](/images/5-Workshop/5.4-Deploy-App/install.png)

#### 3. Run Application

Start the Streamlit app:

```bash
streamlit run app.py
```

If successful, you will see the message `You can now view your Streamlit app in your browser.` along with the URLs.

![Streamlit Running](/images/5-Workshop/5.4-Deploy-App/run-app.png)
