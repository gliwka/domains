locals {
  emailDomains = toset(["gliwka.eu", "gliwka.de", "cerebuild.com"])
}

resource "gandi_livedns_record" "mx" {
    for_each = local.emailDomains
    zone = each.key
    name = "@"
    type = "MX"
    ttl = 18000
    values = [
        "10 mxext1.mailbox.org.",
        "10 mxext2.mailbox.org.",
        "20 mxext3.mailbox.org."
    ]
}

resource "gandi_livedns_record" "spf" {
    for_each = local.emailDomains
    zone = each.key
    name = "@"
    type = "TXT"
    ttl = 18000
    values = ["\"v=spf1 include:mailbox.org include:_spf.google.com ~all\""]
}

resource "gandi_livedns_record" "dmarc" {
    for_each = local.emailDomains
    zone = each.key
    name = "_dmarc"
    type = "TXT"
    ttl = 18000
    values = ["\"v=DMARC1; p=reject; rua=mailto:postmaster@gliwka.eu; adkim=s; aspf=s;\""]
}

resource "gandi_livedns_record" "dkim_1" {
    for_each = local.emailDomains
    zone = each.key
    name = "MBO0001._domainkey"
    type = "CNAME"
    ttl = 18000
    values = ["MBO0001._domainkey.mailbox.org."]
}

resource "gandi_livedns_record" "dkim_2" {
    for_each = local.emailDomains
    zone = each.key
    name = "MBO0002._domainkey"
    type = "CNAME"
    ttl = 18000
    values = ["MBO0002._domainkey.mailbox.org."]
}

resource "gandi_livedns_record" "dkim_3" {
    for_each = local.emailDomains
    zone = each.key
    name = "MBO0003._domainkey"
    type = "CNAME"
    ttl = 18000
    values = ["MBO0003._domainkey.mailbox.org."]
}

resource "gandi_livedns_record" "dkim_4" {
    for_each = local.emailDomains
    zone = each.key
    name = "MBO0004._domainkey"
    type = "CNAME"
    ttl = 18000
    values = ["MBO0004._domainkey.mailbox.org."]
}
