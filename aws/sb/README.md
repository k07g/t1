# aws/sb

sandbox 環境の AWS インフラストラクチャを管理する Terraform 設定。

## Terraform Cloud

| 項目 | 値 |
|------|-----|
| 組織 | k07g |
| ワークスペース | t1-sb |
| プロジェクト | sandbox |
| AWS リージョン | ap-northeast-1 |

## リソース

### ECR (`ecr.tf`)

| リポジトリ名 | タグの変更 | プッシュ時スキャン |
|-------------|-----------|----------------|
| g2 | MUTABLE | 有効 |

## 要件

- Terraform >= 1.14.7
- AWS Provider >= 6.0
- Terraform Cloud アカウント（組織: k07g）

## 使い方

```bash
cd aws/sb
terraform init
terraform plan
terraform apply
```
