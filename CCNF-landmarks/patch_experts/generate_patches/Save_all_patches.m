function Save_all_patches(trainingLoc, frontalView, profile_views, scaling, sigma, version, patches_loc, varargin)
% need some documentation here

if(sum(strcmp(varargin,'ratio_neg')))
    ind = find(strcmp(varargin,'ratio_neg')) + 1;
    ratio_neg = varargin{ind};
else
    ratio_neg = 20;
end

if(sum(strcmp(varargin,'num_samples')))
    ind = find(strcmp(varargin,'num_samples')) + 1;
    num_samples = varargin{ind};
else
    num_samples = 5e5;
end

% first do the frontal view
imgs_used = Save_patches(trainingLoc, frontalView, scaling, sigma, ratio_neg, num_samples, patches_loc, 'frontal', varargin{:});
%imgs_used = ...
%    AppendTraining(trainingLoc, frontalView, scaling, sigma, ratio_neg, num_samples, patches_loc, 'patches_view', 'frontal', varargin{:});

fprintf('Frontal done\n');

% now do the profile views
for i=1:numel(profile_views)
    view_name = sprintf(['profile%s'], num2str(i));
    imgs_used_profile = ...
        Save_patches(trainingLoc, profile_views(i), scaling, sigma, ratio_neg, num_samples, patches_loc, view_name, varargin{:});
%    imgs_used_profile = ...
%        AppendTraining(trainingLoc, profile_views(i), scaling, sigma, ratio_neg, num_samples, patches_loc, 'patches_view', view_name, varargin{:});
    fprintf('Profile %d done\n', i);
    
    imgs_used = cat(1, imgs_used, imgs_used_profile);

end

% save the images used
[status,msg,msgID] = mkdir('generated');
location_imgs_used = sprintf('generated/imgs_used_%s.mat', version);
save(location_imgs_used, 'imgs_used');

end

%function [imgs_used] = AppendTraining(training_data_loc, view, scale, sigma, ratio_neg, num_samples, patches_loc, varargin)
%
%    [imgs_used] = Save_patches(training_data_loc, view, scale, sigma, ratio_neg, num_samples, patches_loc, varargin{:});
%    %[correlations, rms_errors, patch_experts, visi_index, centres, imgs_used, norm_options] = Train_CCNF_patches(training_data_loc, view, scale, sigma, ratio_neg, num_samples, varargin{:});
%    
%%    if(numel(patches_m_init.correlations) > 0)
%%        patches_m.correlations = cat(1, patches_m_init.correlations, correlations);
%%        patches_m.rms_errors = cat(1, patches_m_init.rms_errors, rms_errors);
%%        patches_m.patch_experts = cat(1, patches_m_init.patch_experts, patch_experts);
%%    else
%%        patches_m.correlations = correlations;
%%        patches_m.rms_errors = rms_errors;
%%        patches_m.patch_experts = patch_experts;
%%    end
%    
%    % also add the visibility indices and centres, as that will need to be
%    % output to the patch expert when it's written out
%%    if(numel(visibilities_init) > 0)
%%        visi_index = cat(1, visibilities_init, visi_index);
%%        centres = cat(1, centres_init, centres);
%%    end
%
%end
