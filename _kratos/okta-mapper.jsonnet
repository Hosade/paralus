local claims = std.extVar('claims');

// Helper function to handle the case when groups are provided via _claim_names/_claim_sources
// (this happens when a user is in many groups)
local getGroups = function() {
  if std.objectHas(claims, 'groups') then
    claims.groups
  else if std.objectHas(claims, '_claim_names') && 
          std.objectHas(claims._claim_names, 'groups') then
    // In this case, you'd need to make a separate call to get the groups
    // This is a placeholder as Kratos doesn't support making HTTP calls in Jsonnet
    []
  else
    [];
};

{
  identity: {
    traits: {
      // Map standard user information
      email: claims.email,
      name: {
        first: claims.given_name,
        last: claims.family_name,
      },
      // Map groups to a traits field
      groups: getGroups(),
    },
    metadata_public: {
      azure_id: claims.sub,
    },
    metadata_admin: {
      azure_groups: getGroups(),
    },
  },
}
