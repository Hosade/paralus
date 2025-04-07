local claims = std.extVar('claims');

{
  identity: {
    traits: {
      email: claims.email,
      [if "openid" in claims.raw_claims then "idp_groups" else null]: claims.raw_claims.openid.groups,
    },
  },
}
