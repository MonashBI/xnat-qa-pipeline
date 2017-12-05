#!/bin/bash

echo $@

EXPECTED_SESSION=$1

EXPECTED_DICOM=$2

#/input/SCANS
ACTUAL_SESSION=$(ls -l /input/SCANS/ | grep -c ^d)

ACTUAL_DICOM=$(find /input/SCANS/ -type f | wc -l)

QC_RESULT="Dear XNAT Admin, \n"

if [ "$EXPECTED_SESSION" -eq "$ACTUAL_SESSION" ] 
then
     QC_RESULT="$QC_RESULT Expected Session count \"$EXPECTED_SESSION\" is equal to Actual session Count \"$ACTUAL_SESSION\" \n"
else
     QC_RESULT="$QC_RESULT Expected Session count \"$EXPECTED_SESSION\" is not equal to Actual session Count \"$ACTUAL_SESSION\" \n"
fi

if [ "$EXPECTED_DICOM" -eq "$ACTUAL_DICOM" ]
then
     QC_RESULT="$QC_RESULT Expected DICOM files count \"$EXPECTED_DICOM\" is equal to Actual DICOM files Count \"$ACTUAL_DICOM\" \n"
else
     QC_RESULT="$QC_RESULT Expected DICOM files count \"$EXPECTED_DICOM\" is not equal to Actual DICOM files Count \"$ACTUAL_DICOM\" \n"
fi

QC_RESULT="$QC_RESULT \n Regards,\n XNAT"
# send Email
echo -e $QC_RESULT | mail -s "XNAT QC Check Results" manish.kumar@monash.edu  -aFrom:xnat-admin@ataxia.xnat

