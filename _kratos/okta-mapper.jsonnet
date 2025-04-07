local claims = std.extVar('claims');

{
  identity: {
    traits: {
      email: claims.email,
      first_name: claims.name,
      last_name: "",
      // Temporarily store information about all available claims
      //idp_groups: [std.toString(std.objectFields(claims.raw_claims.groups))],
      idp_groups: claims.raw_claims.groups,
    },
  },
}
