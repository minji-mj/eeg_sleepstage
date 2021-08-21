function Y = butterbpf(X,fs,fbp)
%BUTTERBPF Butterworth Bandpass Filter

    n = 8;      % default order 8
    fn = fs/2;  % nyquist frequency

    % Butterworth filter
    [b,a] = butter(n,[min(fbp)/fn max(fbp)/fn]);
    Y = filter(b,a,X);
end