# HPC チュートリアル

## Slurm による HPC 環境の構築

1. 以下をクリックし、Cloud Shell 環境を起動してください。

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.png)](https://console.cloud.google.com/home/dashboard?cloudshell=true)

2. 以下のコマンドをブラウザ上のターミナルで実行してください。チュートリアルが開始します。

```sh
cloudshell_open --page "shell" \
    --repo_url "https://github.com/google-cloud-japan/hpc-foundation-handson.git" \
    --tutorial "slurm/tutorial.md"
```

3. Cloud Shell の再起動や予期せずチュートリアルが消えてしまった場合は以下で再開できます。

```sh
teachme ~/cloudshell_open/hpc-foundation-handson/slurm/tutorial.md
```

## Slurm と Lustre による HPC 環境の構築

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.png)](https://console.cloud.google.com/home/dashboard?cloudshell=true)

```sh
cloudshell_open --page "shell" \
    --repo_url "https://github.com/google-cloud-japan/hpc-foundation-handson.git" \
    --tutorial "slurm-lustre/tutorial.md"
teachme ~/cloudshell_open/hpc-foundation-handson/slurm-lustre/tutorial.md
```

## Slurm と Lustre による HPC 環境の構築（共有 VPC 版）

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.png)](https://console.cloud.google.com/home/dashboard?cloudshell=true)

```sh
cloudshell_open --page "shell" \
    --repo_url "https://github.com/google-cloud-japan/hpc-foundation-handson.git" \
    --tutorial "slurm-lustre-with-shared-vpc/tutorial.md"
teachme ~/cloudshell_open/hpc-foundation-handson/slurm-lustre-with-shared-vpc/tutorial.md
```
