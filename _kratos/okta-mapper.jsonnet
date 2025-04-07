local claims = std.extVar('claims');

{
  identity: {
    traits: {
      email: claims.email,
      // Temporarily store information about all available claims
      idp_groups: [std.toString(std.objectFields(claims.raw_claims.groups))],
    },
  },
}
