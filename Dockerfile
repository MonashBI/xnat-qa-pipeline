FROM ubuntu:16.04
#install mailutils to send emails
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update && apt-get install -y mailutils ssmtp
#COPY email config
COPY ssmtp.conf /etc/ssmtp/ssmtp.conf
#copy script and  change permission
COPY run.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/run.sh
#label generated by running command2label.py on scan-number-check.json
LABEL org.nrg.commands="[{\"index\": null, \"working-directory\": null, \"description\": \"Runs QA on ingested Scanning Session\", \"command-line\": \"run.sh #SCANS# #DICOM#\", \"inputs\": [{\"command-line-flag\": null, \"name\": \"Required Scans Count\", \"default-value\": \"\", \"matcher\": null, \"false-value\": null, \"required\": true, \"true-value\": null, \"replacement-key\": \"#SCANS#\", \"command-line-separator\": null, \"type\": \"string\", \"description\": \"Number of Required Scans\"}, {\"command-line-flag\": null, \"name\": \"Expected DICOM Files Count\", \"default-value\": null, \"matcher\": null, \"false-value\": null, \"required\": true, \"true-value\": null, \"replacement-key\": \"#DICOM#\", \"command-line-separator\": null, \"type\": \"string\", \"description\": \"Number of expected DICOM Files in each Scan\"}], \"outputs\": [], \"image\": \"xnat/debug-command:1.2\", \"label\": null, \"version\": \"1.0\", \"info-url\": null, \"xnat\": [{\"derived-inputs\": [], \"contexts\": [\"xnat:imageSessionData\"], \"description\": \"Run QA on injested scanning session\", \"output-handlers\": [], \"external-inputs\": [{\"name\": \"session\", \"load-children\": false, \"required\": true, \"provides-files-for-command-mount\": \"input\", \"type\": \"Session\", \"description\": \"Input session\"}], \"name\": \"Xnat-Scan-Number-Check\"}], \"mounts\": [{\"writable\": false, \"path\": \"/input\", \"name\": \"input\"}], \"schema-version\": \"1.0\", \"environment-variables\": {}, \"type\": \"docker\", \"ports\": {}, \"name\": \"XNAT Scan Number Check\"}]"
