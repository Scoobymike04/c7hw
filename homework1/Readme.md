Homework for class 7 week 1


Lab Instructions


Prerequisites


Sign into the AWS Console Verify the region you are using Navigate to the EC2 Dashboard


Step 1: Security Group Creation


Create a security group with only an HTTP rule


Navigate to Security Groups:


Left pane → Network and Security → Security Groups


Create Security Group:


Click "Create Security Group" Enter SG Name and Description Verify VPC is set to default Add inbound HTTP rule with "Anywhere IPv4" source (0.0.0.0/0) Don't modify outbound rules - verify "All traffic" is allowed (Optional: Add tags) Click "Create Security Group"


Verification: Verify SG is created and correctly configured Step 2: Obtain Startup Script


Choose from the available scripts [https://github.com/MookieWAF/bmc4/blob/main/ec2scrpit](https://github.com/MookieWAF/bmc4/blob/main/ec2scrpit)


Copy the script from GitHub Step 3: Launch EC2 Instance


Navigate to Instances:


Left pane → Instances → Instances Click "Launch Instances" Configure Instance:


Name and Tags: Enter instance name, add relevant tags AMI Selection: Review AMI menu, ensure defaults are selected, collapse Instance Type: Review instance type menu, ensure proper sizing, collapse Key Pair: Select "Proceed without key pair", collapse Network Settings:


Don't click "Edit" Verify VPC selection Note: Subnet selection is not critical for this lab Ensure "Auto-assign public IP" is enabled Select your created Security Group (NOT "launch-wizard"!) Collapse section Storage Configuration:


Review Configure Storage menu Brief discussion: What is EBS? Collapse section Advanced Settings:


Open Advanced Settings Focus on User Data section only - ignore everything else Paste your chosen startup script Launch:


Review configuration Click "Launch Instance" Step 4: Test Your Web Server


Wait for the instance to pass status checks Copy the instance's public DNS address Open your web browser Navigate to: http:// Important: Use http:// prefix, not https://


Troubleshooting


Listed in order from most likely to least likely causes:


1. URL Issues (Most Common)


Missing Protocol: You forgot to put http:// in front of the public DNS address Without the prefix, modern browsers redirect to HTTPS (port 443 instead of 80) Wrong DNS Address: You're using the private DNS address instead of public Private DNS only works inside the VPC Correct format: http://


2. Security Group Configuration


Does your EC2 instance have a Security Group assigned? Does the assigned SG have an inbound (ingress) rule for HTTP (port 80 TCP) with IPv4 source from anywhere (0.0.0.0/0)? Does the outbound rule exist and permit all ports and protocols?


3. User Data Script Issues


You incorrectly copied and pasted the user data/startup script You may have forgotten to copy/paste it entirely


4. Less Likely Issues:


Wrong VPC: You're using an incorrect VPC Broken Default VPC: You deleted the Internet Gateway (IGW) or edited the Route Tables (RTBs) No Public IP: You disabled the auto-assign public IP feature Security Group Editing: You edited the SG without first removing it from the EC2 instance


Teardown


Terminate the EC2 Instance


Navigate to EC2 → Instances Select your instance Instance State → Terminate Instance Delete Security Group (Optional)


Navigate to EC2 → Security Groups Select your created security group Actions → Delete Security Group Note: Can only delete after instance termination
https://private-user-images.githubusercontent.com/13282738/489361848-826b3645-cb28-47fd-9d74-13fa276bf6f0.png?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTk3MDE3ODQsIm5iZiI6MTc1OTcwMTQ4NCwicGF0aCI6Ii8xMzI4MjczOC80ODkzNjE4NDgtODI2YjM2NDUtY2IyOC00N2ZkLTlkNzQtMTNmYTI3NmJmNmYwLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTEwMDUlMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUxMDA1VDIxNTgwNFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTc3YmY4MGZkYmVjODVhZjRiNDdiZWMxYTBkYmNlMzlhNmI4YjRjMzljZjNiZTViNDI1NzFmNmZlMTM5ZjQ5NzImWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.AyBLBVGz6sPifrous8mH8Abvfa3YlMlEgfkU8OIc8Mw