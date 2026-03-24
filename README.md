# t1

AWS インフラストラクチャを管理する Terraform プロジェクト。

## 概要

Terraform Cloud を使用して AWS リソースを管理します。

| 項目 | 値 |
|------|-----|
| Terraform Cloud 組織 | k07g |
| ワークスペース | t1 |
| プロジェクト | sandbox |
| AWS リージョン | ap-northeast-1 |

## リソース

### ECR

| リポジトリ名 | タグの変更 | プッシュ時スキャン |
|-------------|-----------|----------------|
| g2 | MUTABLE | 有効 |

## 要件

- Terraform >= 1.14.7
- AWS Provider >= 6.0

## 使い方

```bash
cd aws/sb
terraform init
terraform plan
terraform apply
```
