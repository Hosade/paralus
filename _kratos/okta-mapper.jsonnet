local claims = std.extVar('claims');

{
  identity: {
    traits: {
      email: claims.email,
      idp_groups: claims.openid.groups,
    },
  },
}
