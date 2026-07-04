import { useState, useEffect } from 'react';
import { getPlatformFlags, debugLog } from '../utils';

export function usePlatform() {
  const initial = getPlatformFlags();
  const [platformInfo, setPlatformInfo] = useState({
    isMobile: initial.isMobile,
    isDesktop: !initial.isMobile,
    isAndroid: initial.isAndroid,
  });

  useEffect(() => {
    const flags = getPlatformFlags();
    // #region agent log
    debugLog('usePlatform.ts:useEffect', 'platform detected', {
      os: flags.os,
      isMobile: flags.isMobile,
      isAndroid: flags.isAndroid,
      userAgent: typeof navigator !== 'undefined' ? navigator.userAgent : '',
    }, 'H1');
    // #endregion
    setPlatformInfo({
      isMobile: flags.isMobile,
      isDesktop: !flags.isMobile,
      isAndroid: flags.isAndroid,
    });
  }, []);

  return platformInfo;
}
