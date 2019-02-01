(provide 'joshua-machinespecific)

(message "Joshua - You're machine specific code is loading")

(when (string= system-name "TM900-MJ043MR1")
      (setq printer-name "//roc-print01/6620_QA_1")
)
